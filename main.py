from Program import PROGRAM
program=PROGRAM()
try:
    while program.Is_Running():
        program.Update()
except:
    program.Clean_Up()
program.Clean_Up()
