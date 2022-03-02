from enum import Enum
import cv2

# MARK: - States/Class for all filters
class FilterState(Enum):
    NONE = 0
    BOX_BLUR = 1 # Gaussian Blur
    LAPLACIAN = 2 # Laplacian
    GRAYSCALE = 3 # Grayscale
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

# MARK: State/Class for Grayscale Filter

class GrayscaleState(Enum):
    NONE = 0
    SW = 1
    HW = 2

class GrayscaleFilter:
    index = 0
    filters = [GrayscaleState.NONE, GrayscaleState.SW, GrayscaleState.HW]

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

        print(F"Changing Grayscale filter to {self.filters[index].name}")



# State/Class for Color Inversion Filter

class InvertedFilterState(Enum):
    NONE = 0 # no filter
    SW = 1 # hardware accelerated version
    HW = 2 # software version

class InvertedFilter:
    index = 0 # no filter index
    filters = [InvertedFilterState.NONE, InvertedFilterState.SW, InvertedFilterState.HW]

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