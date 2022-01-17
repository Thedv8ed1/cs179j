import traceback
from Program import PROGRAM
from Buttons import BUTTONS
program=PROGRAM()
buttons=BUTTONS()
try:
    while program.Is_Running():
        print("Shiba")
        program.Update()
        buttons.Poll_Buttons()

except (SyntaxError,TypeError,KeyboardInterrupt,ValueError,RuntimeError,NameError,LookupError,AttributeError) as e:
    traceback.print_exc()
    print("Error type: ", e.__class__.__name__)
    program.Clean_Up()
program.Clean_Up()
