from State_Machine import STATE_MACHINE
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *
from pynq import MMIO
import cv2
import os
import numpy as np
from Enums import FilterState
from Enums import Filter
from Enums import ColorMapState
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
        print("Finished initialization")
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

    # MARK: - Photo filters for HDMI input
    def applyNoFilter(self):
        MMIO(0x40010000,10000).write(0x10,0)
        return None # Dummy function

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

    def Invert_Colors(self): ## TODO figure out a better way to toggle filter
        MMIO(0x40010000,10000).write(0x10,1)
        #result = np.ndarray(shape=(self.hdmi_in.mode.height, self.hdmi_in.mode.width), dtype=np.uint8)
        #outframe = self.hdmi_out.newframe()
        #cv2.bitwise_not(result, dst=outframe)
        #self.in_frame=outframe
