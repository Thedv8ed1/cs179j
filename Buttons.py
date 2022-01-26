from Enums import FilterState
from Enums import Filter


class BUTTONS:
    # private methods
    def __init__(self,filter,base):
        print("buttons initialized")
        # no filter applied by default
        self.filter=filter
        self.base=base
        self.__TurnOffAllLeds()

    def __TurnOffAllLeds(self):
        for led in self.base.leds:
            led.off()

    def __handleLEDForIndex(self, index: int):
        self.__TurnOffAllLeds()
        self.base.leds[index].toggle() 

    # public methods
    def Poll_Buttons(self):
        # check if any button has been pressed

        # button 1
        if (self.base.buttons[0].read()==1):
            self.__handleLEDForIndex(0)
            self.filter.setFilterState(FilterState.FILTER1)
            print("selected filter for button 0")
    
        # button 2
        elif (self.base.buttons[1].read()==1):
            self.__handleLEDForIndex(1)
            self.filter.setFilterState(FilterState.FILTER2)
            print("selected filter for button 1")

        # button 3
        elif (self.base.buttons[2].read()==1):
            self.__handleLEDForIndex(2)
            self.filter.setFilterState(FilterState.FILTER3)
            print("selected filter for button 2")

        # button 4
        elif (self.base.buttons[3].read()==1):
            self.__handleLEDForIndex(3)
            self.filter.setFilterState(FilterState.FILTER4)
            print("selected filter for button 3")
