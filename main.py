import traceback
from Program import PROGRAM
program=PROGRAM()
try:
    while program.Is_Running():
        program.Update()
except (SyntaxError,TypeError,KeyboardInterrupt,ValueError,RuntimeError,NameError,LookupError,AttributeError) as e:
    traceback.print_exc()
    print("Error type: ", e.__class__.__name__)
    program.Clean_Up()
program.Clean_Up()
