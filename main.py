import traceback
from Program import PROGRAM
from Buttons import BUTTONS
program=PROGRAM()
buttons=BUTTONS()
try:
    while program.Is_Running():
        program.Update()
        buttons.Poll_Buttons()
except (Exception) as e:
    traceback.print_exc()
    print("Error type: ", e.__class__.__name__)
finally:
    print("Cleaning up...")
    program.Clean_Up()
