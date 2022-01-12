import States

class STATE_MACHINE:
    def __init__(self,owner):
        self.owner=owner # who owns this state machine
        self.current_state=States.READ_FRAME()
        self.previous_state=None
    def Update(self):
        self.current_state.Execute(self.owner)
    def Change_State(self,new_state):
        self.previous_state=self.current_state
        self.current_state.Exit(self.owner)
        self.current_state=new_state
        self.current_state.Enter(self.owner)
    def Revert_State():
        Change_State(self.previous_state)
