import Program
from Enums import FilterState
from Enums import ColorMap
colorMap=ColorMap()

# reads a frame from hdmi port
class READ_FRAME:
    @staticmethod
    def Enter(program):
        print("")
        #print("Reading frame.")
    @staticmethod
    def Execute(program):
        program.Read_HDMI()
        program.Change_State(GET_BUTTON_INPUT())
    @staticmethod
    def Exit(program):
        pass

class GET_BUTTON_INPUT:
    @staticmethod
    def Enter(program):
        print("")
        #print("Getting button input.")
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
        print("")
        #print("Applying filter.")
    @staticmethod
    def Execute(program):
        filter=program.Get_Filter()
        if (filter == FilterState.NONE):
            program.applyNoFilter()
        elif (filter == FilterState.FILTER1):
            program.applyGaussianBlur()
        elif (filter == FilterState.FILTER2):
            program.applyLaplacian()
        elif (filter == FilterState.FILTER3):
            program.applyColorFilter(colorMap.getColorMap())
        elif (filter == FilterState.FILTER4):
            program.Invert_Colors()
        else: # default
            program.__applyNoFilter()
        program.Change_State(WRITE_FRAME()) 
    @staticmethod
    def Exit(program):
        pass

class WRITE_FRAME:
    @staticmethod
    def Enter(program):
        pass#print("Writting frame.")
    @staticmethod
    def Execute(program):
        program.Write_HDMI()
        program.Change_State(READ_FRAME())
    @staticmethod
    def Exit(program):
        pass
