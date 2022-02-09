from enum import Enum
#from pynq.overlays.base import BaseOverlay
import cv2

# change filter names later: Gaussian Blur, Sobel, Laplacian, color filter? (each press iterates through color in colorArr)
class FilterState(Enum):
    NONE = 0
    FILTER1 = 1 # Gaussian Blur
    FILTER2 = 2 # Laplacian
    FILTER3 = 3 # Color Maps
    FILTER4 = 4 # Inverted Color

# MARK: - Global variable for selected filter type
class Filter:

    selectedFilterState = FilterState.NONE

    def __init__(self):
        print("globals initialized")
        global selectedFilterState
        selectedFilterState = FilterState.NONE

    def getFilterState(self):
        # print(selectedFilterState.value)
        return selectedFilterState

    def setFilterState(self, state: FilterState):
        global selectedFilterState
        print(F"Changing filter state to {state.name}")
        selectedFilterState = state

class ColorMapState(Enum):
    JET = 2 # cv2.COLORMAP_JET
    HOT = 11 # cv2.COLORMAP_HOT
    RAINBOW = 4 # cv2.COLORMAP_RAINBOW
    COOL = 8 # cv2.COLORMAP_COOL

class ColorMap:

    selectedColorMapIndex = 0
    colorMaps = [ColorMapState.JET, ColorMapState.HOT, ColorMapState.RAINBOW, ColorMapState.COOL]

    def __init__(self):
        global selectedColorMapIndex
        selectedColorMapIndex = 0

    def getColorMap(self):
        global selectedColorMapIndex
        global colorMaps
        # print(self.colorMaps[selectedColorMapIndex])
        return self.colorMaps[selectedColorMapIndex]

    def setColorMap(self):
        # 0 <= index <= 3
        global selectedColorMapIndex

        if (selectedColorMapIndex == 3):
            selectedColorMapIndex = 0
        else:
            selectedColorMapIndex = selectedColorMapIndex+1

        print(F"Changing color map to {self.colorMaps[selectedColorMapIndex].name}")

