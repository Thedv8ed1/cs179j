from enum import Enum

# change filter names later: Gaussian Blur, Sobel, Laplacian, color filter? (each press iterates through color in colorArr)
class FilterState(Enum):
    NONE = 0
    FILTER1 = 1
    FILTER2 = 2
    FILTER3 = 3
    FILTER4 = 4

# MARK: - Global variable for selected filter type
class Filter:

    selectedFilterState = FilterState.NONE

    def __init__(self):
        print("globals initialized")
        global selectedFilterState
        selectedFilterState = FilterState.NONE

    def getFilterState(self):
        print(selectedFilterState.value)
        return selectedFilterState.value

    def setFilterState(self, state: FilterState):
        global selectedFilterState
        selectedFilterState = state
 