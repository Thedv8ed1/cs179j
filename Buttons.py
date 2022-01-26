from Enums import FilterState
from Enums import Filter


class BUTTONS:
    # private methods
    def __init__(self, filter: Filter, base):
        print("buttons initialized")
        # no filter applied by default
        self.filter=filter
        self.base=base
        self.held = [False, False, False, False]
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
        if self.base.buttons[0].read():
            if not self.held[0]:
                self.held[0] = True
                if self.filter.getFilterState() == FilterState.FILTER1:
                    self.__TurnOffAllLeds()
                    self.filter.setFilterState(FilterState.NONE)
                    print("Unselecting Filter 0")
                else:
                    self.__handleLEDForIndex(0)
                    self.filter.setFilterState(FilterState.FILTER1)
                    print("Selecting Filter 0")
        else:
            self.held[0] = False

        # button 2
        if self.base.buttons[1].read():
            if not self.held[1]:
                self.held[1] = True
                if self.filter.getFilterState() == FilterState.FILTER2:
                    self.__TurnOffAllLeds()
                    self.filter.setFilterState(FilterState.NONE)
                    print("Unselecting Filter 1")
                else:
                    self.__handleLEDForIndex(1)
                    self.filter.setFilterState(FilterState.FILTER2)
                    print("Selecting Filter 1")
        else:
            self.held[1] = False

        # button 3
        if self.base.buttons[2].read():
            if not self.held[2]:
                self.held[2] = True
                if self.filter.getFilterState() == FilterState.FILTER3:
                    self.__TurnOffAllLeds()
                    self.filter.setFilterState(FilterState.NONE)
                    print("Unselecting Filter 2")
                else:
                    self.__handleLEDForIndex(2)
                    self.filter.setFilterState(FilterState.FILTER3)
                    print("Selecting Filter 2")
        else:
            self.held[2] = False

        # button 4
        if self.base.buttons[3].read():
            if not self.held[3]:
                self.held[3] = True
                if self.filter.getFilterState() == FilterState.FILTER4:
                    self.__TurnOffAllLeds()
                    self.filter.setFilterState(FilterState.NONE)
                    print("Unselecting Filter 3")
                else:
                    self.__handleLEDForIndex(3)
                    self.filter.setFilterState(FilterState.FILTER4)
                    print("Selecting Filter 3")
        else:
            self.held[3] = False
