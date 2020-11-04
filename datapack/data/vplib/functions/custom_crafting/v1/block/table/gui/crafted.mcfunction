#> vplib:custom_crafting/v1/block/table/gui/crafted
#say DEBUG Crafted.

# Get grid early for this process
function vplib:custom_crafting/v1/block/table/general/get_grid

# Reset ignore list
data remove storage vplib:temp ignoredSlots

# Call crafted hook(allow datapacks to execute extra functionality in a crafting)
scoreboard players operation #recipe vplib.temp = @s vplib.data
scoreboard players set #crafted vplib.temp 1
scoreboard players set #button.craft_all vplib.temp 0
function #vplib:custom_crafting/api/table/recipes/crafted

# Consume grid items(default)
execute unless data storage vplib:temp {ignoredSlots:[2b]} if data storage vplib:temp containerGrid[{Slot:2b}] store result block ~ ~ ~ Items[{Slot:2b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:2b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[3b]} if data storage vplib:temp containerGrid[{Slot:3b}] store result block ~ ~ ~ Items[{Slot:3b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:3b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[4b]} if data storage vplib:temp containerGrid[{Slot:4b}] store result block ~ ~ ~ Items[{Slot:4b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:4b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[11b]} if data storage vplib:temp containerGrid[{Slot:11b}] store result block ~ ~ ~ Items[{Slot:11b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:11b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[12b]} if data storage vplib:temp containerGrid[{Slot:12b}] store result block ~ ~ ~ Items[{Slot:12b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:12b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[13b]} if data storage vplib:temp containerGrid[{Slot:13b}] store result block ~ ~ ~ Items[{Slot:13b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:13b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[20b]} if data storage vplib:temp containerGrid[{Slot:20b}] store result block ~ ~ ~ Items[{Slot:20b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:20b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[21b]} if data storage vplib:temp containerGrid[{Slot:21b}] store result block ~ ~ ~ Items[{Slot:21b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:21b}].Count 0.9999999999
execute unless data storage vplib:temp {ignoredSlots:[22b]} if data storage vplib:temp containerGrid[{Slot:22b}] store result block ~ ~ ~ Items[{Slot:22b}].Count byte 1 run data get storage vplib:temp containerGrid[{Slot:22b}].Count 0.9999999999

# Update container
data modify storage vplib:temp container set from block ~ ~ ~ Items

# Force updates
scoreboard players set #update_grid vplib.temp 1
scoreboard players set #update_result vplib.temp 1