import time

class READ_HDMI:
    @staticmethod
    def Enter(program):
        pass
    @staticmethod
    def Execute(program):
        start=time.time()
        while time.time()-start < 30:
            program.Read_HDMI()
            program.Write_HDMI()
        print("exe")
    @staticmethod
    def Exit(program):
        pass
    def On_Message(owner,signal): pass # TODO