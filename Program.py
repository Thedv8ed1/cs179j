from State_Machine import STATE_MACHINE
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *

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
        self.frames=500 #for testing, run for 500 frames
    def Update(self):
        self.state_machine.Update()
        frames-=1
        if not frames:
            is_running=False
    def Is_Running(self):
        return self.is_running

    def Clean_Up(self):
        self.hdmi_out.close()
        self.hdmi_in.close()
    def Read_HDMI(self):
        self.frame=self.hdmi_in.readframe()
    def Write_HDMI(self):
        self.hdmi_out.writeframe(self.frame)



