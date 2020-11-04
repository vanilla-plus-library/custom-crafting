#> vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/subtract_grid

# Get grid count
execute store result score #grid0 vplib.temp run data get storage vplib:temp containerGrid[{Slot:2b}].Count
execute store result score #grid1 vplib.temp run data get storage vplib:temp containerGrid[{Slot:3b}].Count
execute store result score #grid2 vplib.temp run data get storage vplib:temp containerGrid[{Slot:4b}].Count
execute store result score #grid3 vplib.temp run data get storage vplib:temp containerGrid[{Slot:11b}].Count
execute store result score #grid4 vplib.temp run data get storage vplib:temp containerGrid[{Slot:12b}].Count
execute store result score #grid5 vplib.temp run data get storage vplib:temp containerGrid[{Slot:13b}].Count
execute store result score #grid6 vplib.temp run data get storage vplib:temp containerGrid[{Slot:20b}].Count
execute store result score #grid7 vplib.temp run data get storage vplib:temp containerGrid[{Slot:21b}].Count
execute store result score #grid8 vplib.temp run data get storage vplib:temp containerGrid[{Slot:22b}].Count

# Store consumed count
execute if score #grid0 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[2b]} store result block ~ ~ ~ Items[{Slot:2b}].Count byte 1 run scoreboard players operation #grid0 vplib.temp -= #crafted vplib.temp
execute if score #grid1 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[3b]} store result block ~ ~ ~ Items[{Slot:3b}].Count byte 1 run scoreboard players operation #grid1 vplib.temp -= #crafted vplib.temp
execute if score #grid2 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[4b]} store result block ~ ~ ~ Items[{Slot:4b}].Count byte 1 run scoreboard players operation #grid2 vplib.temp -= #crafted vplib.temp
execute if score #grid3 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[11b]} store result block ~ ~ ~ Items[{Slot:11b}].Count byte 1 run scoreboard players operation #grid3 vplib.temp -= #crafted vplib.temp
execute if score #grid4 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[12b]} store result block ~ ~ ~ Items[{Slot:12b}].Count byte 1 run scoreboard players operation #grid4 vplib.temp -= #crafted vplib.temp
execute if score #grid5 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[13b]} store result block ~ ~ ~ Items[{Slot:13b}].Count byte 1 run scoreboard players operation #grid5 vplib.temp -= #crafted vplib.temp
execute if score #grid6 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[20b]} store result block ~ ~ ~ Items[{Slot:20b}].Count byte 1 run scoreboard players operation #grid6 vplib.temp -= #crafted vplib.temp
execute if score #grid7 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[21b]} store result block ~ ~ ~ Items[{Slot:21b}].Count byte 1 run scoreboard players operation #grid7 vplib.temp -= #crafted vplib.temp
execute if score #grid8 vplib.temp matches 1.. unless data storage vplib:temp {ignoredSlots:[22b]} store result block ~ ~ ~ Items[{Slot:22b}].Count byte 1 run scoreboard players operation #grid8 vplib.temp -= #crafted vplib.temp

# Force updates
scoreboard players set #update_grid vplib.temp 1
scoreboard players set #update_result vplib.temp 1