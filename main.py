from Program import PROGRAM
program=PROGRAM()
while program.Is_Running():
    program.Update()
program.Clean_Up()
