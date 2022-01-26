import traceback
from Program import PROGRAM
program=PROGRAM()

try:
    while program.Is_Running():
        program.Update()   
except (Exception) as e:
    traceback.print_exc()
    print("Error type: ", e.__class__.__name__)
finally:
    print("Cleaning up...")
    program.Clean_Up()
