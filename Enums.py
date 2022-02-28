from enum import Enum
import cv2

# MARK: - States/Class for all filters
class FilterState(Enum):
    NONE = 0
    BOX_BLUR = 1 # Gaussian Blur
    LAPLACIAN = 2 # Laplacian
    COLORMAP = 3 # Colormaps
    INVERTED = 4 # Inverted Color

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
        


# MARK:- States/Class for Box Blur Filter

class BoxBlurState(Enum):
    NONE = 0
    SW = 1
    HW = 2

class BoxBlurFilter:
    index = 0
    filters = [BoxBlurState.NONE, BoxBlurState.SW, BoxBlurState.HW]

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

        print(F"Changing box filter state to {self.filters[index].name}")



# MARK: - State/Class for Laplacian Filter

class LaplacianFilterState(Enum):
    NONE = 0 # no filter
    SW = 1 # software version
    HW = 2 # hardware accelerated version


class LaplacianFilter:
    index = 0 # no filter index
    filters = [LaplacianFilterState.NONE, LaplacianFilterState.SW, LaplacianFilterState.HW]

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

        print(F"Changing Laplacian filter to {self.filters[index].name}")


# MARK:- State/Class for Colormap Filter

class ColorMapState(Enum):
    # 0 = SW, 1 = HW
    JET_SW = 2, 0 # cv2.COLORMAP_JET
    JET_HW = 2, 1
    HOT_SW = 11, 0 # cv2.COLORMAP_HOT
    HOT_HW = 11, 1
    SPRING_SW = 7, 0 # cv2.COLORMAP_SPRING
    SPRING_HW = 7, 1
    COOL_SW = 8, 0 # cv2.COLORMAP_COOL
    COOL_HW = 8, 1
    NONE = -1, -1

    def __init__(self, map_type, performance):
        self.map_type = map_type
        self.performance = performance


class ColorMap:

    selectedColorMapIndex = 8
    colorMaps = [ColorMapState.JET_SW, ColorMapState.JET_HW, ColorMapState.HOT_SW, ColorMapState.HOT_HW, ColorMapState.SPRING_SW, ColorMapState.SPRING_HW, ColorMapState.COOL_SW, ColorMapState.COOL_HW, ColorMapState.NONE]

    def __init__(self):
        global selectedColorMapIndex
        selectedColorMapIndex = 8

    def getColorMap(self):
        global selectedColorMapIndex
        global colorMaps
        return self.colorMaps[selectedColorMapIndex]

    def setColorMap(self):
        # 0 <= index <= 8
        global selectedColorMapIndex

        if (selectedColorMapIndex == 8):
            selectedColorMapIndex = 0
        else:
            selectedColorMapIndex = selectedColorMapIndex+1

        print(F"Changing color map to {self.colorMaps[selectedColorMapIndex].name}")


# State/Class for Color Inversion Filter

class InvertedFilterState(Enum):
    NONE = 0 # no filter
    HW = 1 # hardware accelerated version
    SW = 2 # software version

class InvertedFilter:
    index = 0 # no filter index
    filters = [InvertedFilterState.NONE, InvertedFilterState.HW, InvertedFilterState.SW]

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