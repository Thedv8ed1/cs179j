import cv2
import numpy as np
from Enums import FilterState
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *

class FILTERS:
    def __init__(self):
        print("filter class initialized")
        selectedFilterState = FilterState.NONE

    # private methods
    @classmethod
    def __applyNoFilter(self):
        for _ in range(numFrames):
            _hdmi_in = hdmi_in.readframe()
            self.hdmi_out.writeframe(_hdmi_in)
            _hdmi_in.freebuffer()



    @classmethod
    def __applyGaussianBlur(self):
        numFrames = 20
        for _ in range(numFrames):
            _hdmi_in = hdmi_in.readframe()
            _hdmi_out = hdmi_out.newframe()
            # Gaussian blur takes src, dst, ksize, optional sigma x,y and border type
            cv2.GaussianBlur(_hdmi_in, _hdmi_out, (8,8), cv2.BORDER_DEFAULT)
            hdmi_out.writeframe(_hdmi_out)
            _hdmi_in.freebuffer()


    # public methods

    def applyFilter(self):
        numFrames = 600
        for _ in range(numFrames):
            frame=hdmi_in.readframe()
            hdmi_out.writeframe(frame)
            #_hdmi_in.freebuffer()
        #print(selectedFilterState)
        #self.__applyNoFilter()
