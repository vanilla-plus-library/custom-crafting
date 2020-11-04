#> vplib:custom_crafting/v1/block/table/general/get_result
# Description: Get result from container.
# Input: 'vplib:temp container'
# Output: 'vplib:temp containerResult'

data remove storage vplib:temp containerResult
data modify storage vplib:temp containerResult set from storage vplib:temp container[{Slot:16b}]
data remove storage vplib:temp containerResult.Slot