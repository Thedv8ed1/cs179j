from enum import Enum
import cv2


class FilterState(Enum):
    NONE = 0
    GAUSSIAN = 1 # Gaussian Blur
    LAPLACIAN = 2 # Laplacian
    COLORMAP = 3 # Colormaps
    INVERTED = 4 # Inverted Color

# MARK: - Global variable for selected filter type
class Filter:

    selectedFilterState = FilterState.NONE

    def __init__(self):
        print("globals initialized")
        global selectedFilterState
        selectedFilterState = FilterState.NONE

    def getFilterState(self):
        return selectedFilterState

    def setFilterState(self, state: FilterState):
        global selectedFilterState
        print(F"Changing filter state to {state.name}")
        selectedFilterState = state

class ColorMapState(Enum):
    JET = 2 # cv2.COLORMAP_JET
    HOT = 11 # cv2.COLORMAP_HOT
    SPRING = 7 # cv2.COLORMAP_SPRING
    COOL = 8 # cv2.COLORMAP_COOL
    NONE = -1

class ColorMap:

    selectedColorMapIndex = 0
    colorMaps = [ColorMapState.JET, ColorMapState.HOT, ColorMapState.SPRING, ColorMapState.COOL, ColorMapState.NONE]

    def __init__(self):
        global selectedColorMapIndex
        selectedColorMapIndex = 0

    def getColorMap(self):
        global selectedColorMapIndex
        global colorMaps
        return self.colorMaps[selectedColorMapIndex]

    def setColorMap(self):
        # 0 <= index <= 4
        global selectedColorMapIndex

        if (selectedColorMapIndex == 4):
            selectedColorMapIndex = 0
        else:
            selectedColorMapIndex = selectedColorMapIndex+1

        print(F"Changing color map to {self.colorMaps[selectedColorMapIndex].name}")


class InvertedFilterState(Enum):
    HW = 0 # hardware accelerated version
    SW = 1 # software version
    NONE = 2 # no filter

class InvertedFilter:
    index = 2 # no filter index
    filters = [InvertedFilterState.HW, InvertedFilterState.SW, InvertedFilterState.NONE]

    def __init__(self):
        global index
        index = 0

    def getFilter(self):
        global index
        global filters
        return self.filters[index]
    
    def setFilter(self):
        global index
        global filters
        if (index == 2):
            index = 0
        else:
            index = index+1

        print(F"Changing inverted filter to {self.filters[index].name}")
