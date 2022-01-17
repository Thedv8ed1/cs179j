from enum import Enum

# change filter names later: Gaussian Blur, Sobel, Laplacian, color filter? (each press iterates through color in colorArr)
class FilterState(Enum):
    FILTER1 = 0
    FILTER2 = 1
    FILTER3 = 3
    FILTER4 = 4

# MARK: - Global variable for selected filter type
selectedFilterState = FilterState.FILTER1