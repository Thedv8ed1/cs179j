from Program import PROGRAM
program=PROGRAM()
try:
    while program.Is_Running():
        program.Update()
except (KeyboardInterrupt,ValueError,RuntimeError,NameError,LookupError,AttributeError):
    program.Clean_Up()
program.Clean_Up()
