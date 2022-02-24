from Enums import FilterState
from Enums import Filter
from Enums import ColorMap
from Enums import InvertedFilter
from Enums import BoxBlurFilter
from Enums import LaplacianFilter
colorMap=ColorMap()
invertedFilter=InvertedFilter()
boxBlurFilter=BoxBlurFilter()
laplacianFilter=LaplacianFilter()


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

        # button 1 (Box Blur)
        if self.base.buttons[0].read():
            if not self.held[0]:
                self.held[0] = True
                if self.filter.getFilterState() == FilterState.BOX_BLUR:
                    boxBlurFilter.setFilter()

                    if (boxBlurFilter.getFilter().value == 0):
                        self.__TurnOffAllLeds()
                        self.filter.setFilterState(FilterState.NONE)
                        #print("Unselecting Filter 1")
                else:
                    boxBlurFilter.setFilter()
                    self.__handleLEDForIndex(0)
                    self.filter.setFilterState(FilterState.BOX_BLUR)
                    #print("Selecting Filter 1")
        else:
            self.held[0] = False

        # button 2 (Laplacian)
        if self.base.buttons[1].read():
            if not self.held[1]:
                self.held[1] = True
                if self.filter.getFilterState() == FilterState.LAPLACIAN:
                    laplacianFilter.setFilter()

                    if (laplacianFilter.getFilter().value == 0):
                        self.__TurnOffAllLeds()
                        self.filter.setFilterState(FilterState.NONE)
                    #print("Unselecting Filter 2")
                else:
                    laplacianFilter.setFilter()
                    self.__handleLEDForIndex(1)
                    self.filter.setFilterState(FilterState.LAPLACIAN)
                    #print("Selecting Filter 2")
        else:
            self.held[1] = False

        # button 3 (Color Map)
        if self.base.buttons[2].read():
            if not self.held[2]:
                self.held[2] = True
                if self.filter.getFilterState() == FilterState.COLORMAP:
                    colorMap.setColorMap()
                    # no filter
                    if (colorMap.getColorMap().value == -1):
                        self.__TurnOffAllLeds()
                        self.filter.setFilterState(FilterState.NONE)
                        print("Unselecting Filter 3")

                else:
                    self.__handleLEDForIndex(2)
                    colorMap.setColorMap()
                    self.filter.setFilterState(FilterState.COLORMAP)
                    #print("Selecting Filter 3")
        else:
            self.held[2] = False

        # button 4 (Color Inversion)
        if self.base.buttons[3].read():
            if not self.held[3]:
                self.held[3] = True
                
                if self.filter.getFilterState() == FilterState.INVERTED:
                    #self.__TurnOffAllLeds()
                    #self.filter.setFilterState(FilterState.NONE)
                    #print("Unselecting Filter 4")
                    invertedFilter.setFilter()
                    # no filter
                    if (invertedFilter.getFilter().value == 0):
                        self.__TurnOffAllLeds()
                        self.filter.setFilterState(FilterState.NONE)
                        #print("Unselecting Filter 4")


                else:
                    invertedFilter.setFilter()
                    self.__handleLEDForIndex(3)
                    self.filter.setFilterState(FilterState.INVERTED)
                    #print("Selecting Filter 4")
        else:
            self.held[3] = False
