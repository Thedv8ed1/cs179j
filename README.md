To run:
``` 
python3 main.py
```
**Program.py** \
Contains functionality. To ensure encapsulation a state machine operates on this class.

**State_Machine.py**\
Basic class to execute and change states.

**States.py**\
Unit of execution. Each state uses methods of the PROGRAM class to accomplish a task. States provide modularity as adding additional states will expand functionality.

**Buttons.py**\
Contains logic for button presses.

**Enums.py**\
Contains Enum class of photo filter states for buttons. For each filter, there is an Enum class to manage the toggled state between the filter options: software/hardware-accelerated/no filter.


```base/``` contains the updated block diagrams for pynq
The three files need to be placed in ```pynq/overlays/base``` otherwise the memory mapped I/O won't work.
