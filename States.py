import Program
from Enums import FilterState
from Enums import GrayscaleFilter
from Enums import InvertedFilter
from Enums import BoxBlurFilter
from Enums import LaplacianFilter
import time
grayscale=GrayscaleFilter()
invertedFilter=InvertedFilter()
boxBlurFilter=BoxBlurFilter()
laplacianFilter=LaplacianFilter()

time_start = 0
frametime_elapsed = 0
last_fps = 0

# reads a frame from hdmi port
class READ_FRAME:
    @staticmethod
    def Enter(program):
        pass
    @staticmethod
    def Execute(program):
        global time_start
        time_start = time.time()
        program.Read_HDMI()
        program.Change_State(GET_BUTTON_INPUT())
    @staticmethod
    def Exit(program):
        pass

class GET_BUTTON_INPUT:
    @staticmethod
    def Enter(program):
        pass
    @staticmethod
    def Execute(program):
        program.Poll_Input()
        program.Change_State(APPLY_FILTERS())
    @staticmethod
    def Exit(program):
        pass

class APPLY_FILTERS:
    @staticmethod
    def Enter(program):
        pass
    @staticmethod
    def Execute(program):
        filter=program.Get_Filter()
        if (filter == FilterState.NONE):
            program.applyNoFilter()
        elif (filter == FilterState.BOX_BLUR):            
            program.applyBoxBlur(boxBlurFilter.getFilter())
        elif (filter == FilterState.LAPLACIAN):
            program.applyLaplacian(laplacianFilter.getFilter())
        elif (filter == FilterState.GRAYSCALE):
            program.applyGrayscaleFilter(grayscale.getFilter())
        elif (filter == FilterState.INVERTED):
            program.applyColorInversion(invertedFilter.getFilter())
        else: # default
            program.__applyNoFilter()
        program.Change_State(WRITE_FRAME())
    @staticmethod
    def Exit(program):
        pass

class WRITE_FRAME:
    @staticmethod
    def Enter(program):
        pass
    @staticmethod
    def Execute(program):
        global time_start, frametime_elapsed, last_fps

        if program.getShowFPS():
            program.applyFPS(last_fps)

        program.Write_HDMI()
        time_elapsed = time.time() - time_start
        last_fps = 1/time_elapsed
        frametime_elapsed = time_elapsed + frametime_elapsed
        # Should prevent it from spamming prints when running at high FPS
        # Limits printing to at a minimum once per second
        if frametime_elapsed >= 1:
            print(F"Frametime: {time_elapsed:.2f}s, FPS: {1/time_elapsed:.2f}")
            frametime_elapsed = 0
        program.Change_State(READ_FRAME())
    @staticmethod
    def Exit(program):
        pass
