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

class ColorMap:

    selectedColorMapIndex = 0
    colorMaps = [ColorMapState.JET, ColorMapState.HOT, ColorMapState.SPRING, ColorMapState.COOL]

    def __init__(self):
        global selectedColorMapIndex
        selectedColorMapIndex = 0

    def getColorMap(self):
        global selectedColorMapIndex
        global colorMaps
        return self.colorMaps[selectedColorMapIndex]

    def setColorMap(self):
        # 0 <= index <= 3
        global selectedColorMapIndex

        if (selectedColorMapIndex == 3):
            selectedColorMapIndex = 0
        else:
            selectedColorMapIndex = selectedColorMapIndex+1

        print(F"Changing color map to {self.colorMaps[selectedColorMapIndex].name}")

