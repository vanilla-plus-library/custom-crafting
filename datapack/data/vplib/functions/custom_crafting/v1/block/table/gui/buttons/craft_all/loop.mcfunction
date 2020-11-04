#> vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/loop

# Get output
data modify storage vplib:temp item set from storage vplib:temp savedData.recipeOutput

# Store data
scoreboard players operation #count vplib.temp = #loop vplib.temp
execute store result storage vplib:temp item.Count byte 1 run scoreboard players operation #count vplib.temp < #127 vplib.math
execute store result storage vplib:temp item.Slot byte 1 run scoreboard players add #slot vplib.temp 1

# Append
data modify storage vplib:temp array append from storage vplib:temp item

# Loop
scoreboard players operation #loop vplib.temp -= #count vplib.temp
execute if score #loop vplib.temp matches 1.. run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/loop