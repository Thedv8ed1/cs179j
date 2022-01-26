from State_Machine import STATE_MACHINE
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *
import cv2
import numpy as np
from Enums import FilterState
from Enums import Filter
filters=Filter()

#TODO come up with a better name than program
class PROGRAM:
    def __init__(self):
        print("Starting program initialization")
        self.base=BaseOverlay("base.bit")
        ## configure HDMI
        self.hdmi_in=self.base.video.hdmi_in
        self.hdmi_out=self.base.video.hdmi_out
        self.hdmi_in.configure(PIXEL_RGB)
        self.hdmi_out.configure(self.hdmi_in.mode,PIXEL_RGB)
        self.hdmi_in.start()
        self.hdmi_out.start()
        self.frame=None
        self.is_running=True
        self.state_machine=STATE_MACHINE(self)
        print("Finished initialization")
    def Update(self):
        self.state_machine.Update()

    def Is_Running(self):
        return self.is_running
    def Change_State(self,state):
        self.state_machine.Change_State(state)

    def Read_HDMI(self):
        self.frame=self.hdmi_in.readframe()

    def Write_HDMI(self):

        filter=filters.getFilterState()

        if (filter == 0):
            # no filter
            self.frame = self.__applyNoFilter(self.frame)
        elif (filter == 1):
            # filter 1
            self.frame = self.__applyGaussianBlur(self.frame)
        elif (filter == 2):
            # filter 2
            self.frame = self.__applyLaplacian(self.frame)
        elif (filter == 3):
            # filter 3
            self.frame = self.__applyNoFilter(self.frame) # TODO
        elif (filter == 4):
            # filter 4
            self.frame = self.__applyNoFilter(self.frame) # TODO
        else:
            # default
            self.__applyNoFilter()

        self.hdmi_out.writeframe(self.frame)

    def Clean_Up(self):
        self.hdmi_out.close()
        self.hdmi_in.close()


    # MARK: - Photo filters for HDMI input

    def __applyNoFilter(self, in_frame):
        return in_frame # Dummy function

    def __applyGaussianBlur(self, in_frame):
        inter = self.hdmi_out.newframe()
        # Gaussian blur takes source, ksize, destination
        cv2.GaussianBlur(in_frame, (15,15), 0, dst=inter)
        return inter

    # source notebook: https://github.com/Xilinx/PYNQ/blob/master/boards/Pynq-Z1/base/notebooks/video/hdmi_introduction.ipynb
    def __applyLaplacian(self, in_frame):
        grayscale = np.ndarray(shape=(self.hdmi_in.mode.height, self.hdmi_in.mode.width),
                       dtype=np.uint8)
        result = np.ndarray(shape=(self.hdmi_in.mode.height, self.hdmi_in.mode.width),
                    dtype=np.uint8)
        cv2.cvtColor(in_frame, cv2.COLOR_BGR2GRAY, dst=grayscale)
        cv2.Laplacian(grayscale, cv2.CV_8U, dst=result)
        outframe = self.hdmi_out.newframe()
        cv2.cvtColor(result, cv2.COLOR_GRAY2BGR,dst=outframe)
        return outframe
