#> vplib:custom_crafting/v1/block/table/general/kill_matching_item
# Description: Kill items that matches a given nbt.
# Input: 'vplib:temp item' / As item

# Get item data
data modify storage vplib:temp compare set from entity @s Item

# Compare
execute store success score #success vplib.temp run data modify storage vplib:temp compare set from storage vplib:temp item

# Kill if matches
execute if score #success vplib.temp matches 0 run kill @s
