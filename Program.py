from State_Machine import STATE_MACHINE
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *
from pynq import MMIO
import cv2
import numpy as np
import os
from Enums import FilterState
from Enums import Filter
from Enums import ColorMapState
from Enums import InvertedFilter
from Buttons import BUTTONS



#TODO come up with a better name than program
class PROGRAM:
    def __init__(self):
        print("Starting program initialization")
        self.base=BaseOverlay(os.getcwd() + "/base/base.bit")
        self.base.download()
        ## configure HDMI
        self.hdmi_in=self.base.video.hdmi_in
        self.hdmi_out=self.base.video.hdmi_out
        self.hdmi_in.configure(PIXEL_RGB)
        self.hdmi_out.configure(self.hdmi_in.mode,PIXEL_RGB)
        self.hdmi_in.start()
        self.hdmi_out.start()
        ## create class data
        self.in_frame=None ## holds frame data
        self.is_running=True
        self.state_machine=STATE_MACHINE(self)
        self.filters=Filter() ## contains the currently set filter
        self.button=BUTTONS(self.filters,self.base) ## contains funtionality for polling button input
        ## initiate filter dmas
        self.inverted_vdma=self.base.Invert_Color.axi_vdma_0
        

        print("Finished initialization")
    def DMA_Initialization():
        # reset vdma in/out channels
        self.inverted_vdma.write(0x00,0x04)
        while self.inverted_vdma.read(0x00)&0x4==4: # wait for reset to finish
            pass
        self.inverted_vdma.write(0x30,0x04)
        while self.inverted_vdma.read(0x30)&0x4==4:
            pass

    def Update(self):
        self.state_machine.Update()

    def Is_Running(self):
        return self.is_running

    def Change_State(self,state):
        self.state_machine.Change_State(state)

    def Read_HDMI(self):
        self.in_frame=self.hdmi_in.readframe()

    def Write_HDMI(self):
        self.hdmi_out.writeframe(self.in_frame)

    def Clean_Up(self):
        self.hdmi_out.close()
        self.hdmi_in.close()

    def Poll_Input(self):
        self.button.Poll_Buttons()

    def Get_Filter(self):
        return self.filters.getFilterState()

    def getShowFPS(self):
        return self.base.switches[0].read()

    def applyFPS(self, fps:int):
        self.in_frame = cv2.rectangle(self.in_frame, (0,0), (110, 30), (0,0,0), -1)
        self.in_frame = cv2.putText(self.in_frame, F"{fps:.2f} FPS", (10,20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)

    # MARK: - Photo filters for HDMI input
    def applyNoFilter(self):
        pass # Dummy function

    def applyGaussianBlur(self):
        outframe = self.hdmi_out.newframe()
        # Gaussian blur takes source, ksize, destination
        cv2.GaussianBlur(self.in_frame, (15,15), 0, dst=outframe)
        self.in_frame=outframe

    # source notebook: https://github.com/Xilinx/PYNQ/blob/master/boards/Pynq-Z1/base/notebooks/video/hdmi_introduction.ipynb
    def applyLaplacian(self):
        grayscale = np.ndarray(shape=(self.hdmi_in.mode.height, self.hdmi_in.mode.width),
                            dtype=np.uint8)
        result = np.ndarray(shape=(self.hdmi_in.mode.height, self.hdmi_in.mode.width),
                            dtype=np.uint8)
        cv2.cvtColor(self.in_frame, cv2.COLOR_BGR2GRAY, dst=grayscale)
        cv2.Laplacian(grayscale, cv2.CV_8U, dst=result)
        outframe = self.hdmi_out.newframe()
        cv2.cvtColor(result, cv2.COLOR_GRAY2BGR,dst=outframe)
        self.in_frame=outframe

    # openCV colormap documentation: https://docs.opencv.org/4.x/d3/d50/group__imgproc__colormap.html
    def applyColorFilter(self, color_map: ColorMapState):
        result = np.ndarray(shape=(self.hdmi_in.mode.height, self.hdmi_in.mode.width), dtype=np.uint8)
        cv2.cvtColor(self.in_frame, cv2.COLOR_BGR2GRAY, dst=result)
        outframe = self.hdmi_out.newframe()
        cv2.applyColorMap(result, color_map.value, dst=outframe)
        self.in_frame=outframe

    def Invert_Colors_HW(self):
        in_buffer_address=self.in_frame.device_address
        self.inverted_vdma.write(0x00,0x93) # start vdma channel
        self.inverted_vdma.write(0x5C,in_buffer_address) # address of input 
        self.inverted_vdma.write(0x58,self.hdmi_in.mode.width*3) # total pixel row data size
        self.inverted_vdma.write(0x54,self.hdmi_in.mode.width*3) # read entire pixels row
        self.inverted_vdma.write(0x50,self.hdmi_in.mode.height) # read all columns
        # send vdma channel
        self.inverted_vdma.write(0x30,0x93)
        self.inverted_vdma.write(0xAC,in_buffer_address)
        self.inverted_vdma.write(0xA8,self.hdmi_in.mode.width*3)
        self.inverted_vdma.write(0xA4,self.hdmi_in.mode.width*3)
        self.inverted_vdma.write(0xA0,self.hdmi_in.mode.height)

        #while self.inverted_vdma.register_map.S2MM_VDMASR.Halted!=1: # wait for vdma to finish
        #    pass
    
    def Invert_Colors(self, inverted_filter: InvertedFilter): ## TODO figure out a better way to toggle filter

        # hardware accelerated inversion filter
        if (inverted_filter.value == 0):
            self.Invert_Colors_HW()

        # software inversion filter
        # FIXME
        elif (inverted_filter.value == 1):
            cv2.bitwise_not(self.in_frame, dst=self.in_frame)
