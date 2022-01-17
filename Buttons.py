from Enums import FilterState
from pynq.overlays.base import BaseOverlay
base = BaseOverlay("base.bit")

class BUTTONS:
    def __init(self):
        print("buttons initialized")
        # select filter 1 by default
        # base.leds[0].toggle()

    @classmethod
    def TurnOffAllLeds(self):
        for led in base.leds:
            led.off()

    @classmethod
    def __handleLEDForIndex(self, index: int):
        TurnOffAllLeds()
        base.leds[index].toggle() 

    @staticmethod
    def Poll_Buttons():
        # check if any button has been pressed

        # button 1
        if (base.buttons[0].read()==1):
            #self.__handleLEDForIndex(0)
            for led in base.leds:
                led.off()
            base.leds[0].toggle()
            selectedFilterState = FilterState.FILTER1
            print("selected filter for button 0:")
            print(selectedFilterState)
    
        # button 2
        elif (base.buttons[1].read()==1):
            #handleLEDForIndex(1)
            for led in base.leds:
                led.off()
            base.leds[1].toggle()
            selectedFilterState = FilterState.FILTER2
            print("selected filter for button 1:")
            print(selectedFilterState)

        # button 3
        elif (base.buttons[2].read()==1):
            #handleLEDForIndex(2)
            for led in base.leds:
                led.off()
            base.leds[2].toggle()
            selectedFilterState = FilterState.FILTER3
            print("selected filter for button 3:")
            print(selectedFilterState)

        # button 4
        elif (base.buttons[3].read()==1):
            #handleLEDForIndex(3)
            for led in base.leds:
                led.off()
            base.leds[3].toggle()
            selectedFilterState = FilterState.FILTER4
            print("selected filter for button 4:")
            print(selectedFilterState)

        

