import Program
import time

# reads a frame from hdmi port
class READ_FRAME:
    @staticmethod
    def Enter(program):
        print("Reading frame.")
    @staticmethod
    def Execute(program):
        program.Read_HDMI()
        program.Change_State(WRITE_FRAME())
    @staticmethod
    def Exit(program):
        pass
    def On_Message(owner,signal): pass # TODO

class WRITE_FRAME:
    @staticmethod
    def Enter(program):
        print("Writting frame.")
    @staticmethod
    def Execute(program):
        program.Write_HDMI()
        program.Change_State(READ_FRAME())
    @staticmethod
    def Exit(program):
        pass
    def On_Message(owner,signal): pass # TODO