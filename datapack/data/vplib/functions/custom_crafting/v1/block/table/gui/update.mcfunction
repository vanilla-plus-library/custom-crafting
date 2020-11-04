#> vplib:custom_crafting/v1/block/table/gui/update
# Description: Update gui slot holders, active recipe and result slot.

# Get saved data(last grid and result).
data modify storage vplib:temp savedData set value {recipeInput:[],recipeOutput:{}}
data modify storage vplib:temp savedData set from entity @s ArmorItems[3].tag.vplib

# Move container to storage.
data modify storage vplib:temp container set from block ~ ~ ~ Items


# Update slot holders.
function vplib:custom_crafting/v1/block/table/gui/slot_holders


# Get result slot.
function vplib:custom_crafting/v1/block/table/general/get_result

# Get grid slots.
function vplib:custom_crafting/v1/block/table/general/get_grid


# Update grid.
function vplib:custom_crafting/v1/block/table/gui/grid/update

# Update result slot.
function vplib:custom_crafting/v1/block/table/gui/result/show_output


# Save data.
data modify entity @s ArmorItems[3].tag.vplib set from storage vplib:temp savedData
