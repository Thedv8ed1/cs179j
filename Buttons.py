from Enums import FilterState
from pynq.overlays.base import BaseOverlay
base = BaseOverlay("base.bit")

class BUTTONS:

    # private methods
    def __init__(self):
        print("buttons initialized")
        # select filter 1 by default
        base.leds[0].toggle()

    @classmethod
    def __TurnOffAllLeds(self):
        for led in base.leds:
            led.off()

    @classmethod
    def __handleLEDForIndex(self, index: int):
        self.__TurnOffAllLeds()
        base.leds[index].toggle() 

    # public methods
    def Poll_Buttons(self):
        # check if any button has been pressed

        # button 1
        if (base.buttons[0].read()==1):
            self.__handleLEDForIndex(0)
            selectedFilterState = FilterState.FILTER1
            print("selected filter for button 0:")
            print(selectedFilterState)
    
        # button 2
        elif (base.buttons[1].read()==1):
            self.__handleLEDForIndex(1)
            selectedFilterState = FilterState.FILTER2
            print("selected filter for button 1:")
            print(selectedFilterState)

        # button 3
        elif (base.buttons[2].read()==1):
            self.__handleLEDForIndex(2)
            selectedFilterState = FilterState.FILTER3
            print("selected filter for button 2:")
            print(selectedFilterState)

        # button 4
        elif (base.buttons[3].read()==1):
            self.__handleLEDForIndex(3)
            selectedFilterState = FilterState.FILTER4
            print("selected filter for button 3:")
            print(selectedFilterState)

        

