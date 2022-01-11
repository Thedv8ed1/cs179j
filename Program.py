from State_Machine import STATE_MACHINE
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *

class PROGRAM:
    def __init__(self):
        self.base=BaseOverlay("base.bit")
        ## configure HDMI
        self.hdmi_in=self.base.video.hdmi_in
        self.hdmi_out=self.base.video.hdmi_out
        self.hdmi_in.configure()
        self.hdmi_out.configure(self.hdmi_in.mode)
        self.hdmi_in.start()
        self.hdmi_out.start()
        self.frame=None
        self.is_running=True
        self.state_machine=STATE_MACHINE(self)

    def Update(self):
        self.state_machine.Update()
    def Is_Running(self):
        return self.is_running

    def Clean_Up(self):
        self.hdmi_out.close()
        self.hdmi_in.close()
    def Read_HDMI(self):
        frame=self.hdmi_in.readframe()
    def Write_HDMI(self):
        hdmi_out.writeframe(frame)



