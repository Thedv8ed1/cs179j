from State_Machine import STATE_MACHINE

class PROGRAM:
    def __init__(self):

        self.is_running=True
        self.state_machine=STATE_MACHINE(self)

    def Update(self):
        self.state_machine.Update()
    def Is_Running(self):
        return self.is_running



