#> vplib:custom_crafting/v1/block/table/general/get_grid
# Description: Get grid from container.
# Input:  'vplib:temp container'
# Output: 'vplib:temp containerGrid'

# Get grid slots.
data modify storage vplib:temp containerGrid set from storage vplib:temp container
data remove storage vplib:temp containerGrid[{Slot:16b}]
data remove storage vplib:temp containerGrid[{tag:{vplib:{slot_holder:1b}}}]