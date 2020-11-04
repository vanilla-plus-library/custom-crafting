#> vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/main

# Get minimum amount that can be crafted(lowest item count in the grid)
data modify storage vplib:temp array set from storage vplib:temp containerGrid

scoreboard players set #minimum vplib.temp 64
function vplib:custom_crafting/v1/block/table/general/get_min_count


# Reset ignore list
data remove storage vplib:temp ignoredSlots

# Call crafted hook(allow datapacks to execute extra functionality in a crafting)
scoreboard players operation #recipe vplib.temp = @s vplib.data
scoreboard players operation #crafted vplib.temp = #minimum vplib.temp
scoreboard players set #button.craft_all vplib.temp 1
function #vplib:custom_crafting/api/table/recipes/crafted


# Get output amount(recipe output count * crafted amount)
execute store result score #output vplib.temp run data get storage vplib:temp savedData.recipeOutput.Count
scoreboard players operation #output vplib.temp *= #crafted vplib.temp
#tellraw @a ["Output: ",{"score": {"name": "#output","objective": "vplib.temp"}}]

# Generate items
data modify storage vplib:temp array set value []

scoreboard players set #127 vplib.math 127
scoreboard players set #slot vplib.temp -1
scoreboard players operation #loop vplib.temp = #output vplib.temp
execute if score #loop vplib.temp matches 1.. run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/loop
#tellraw @a ["Items: ",{"nbt":"array","storage": "vplib:temp"}]

# Search players
scoreboard players set #found_player vplib.temp 0
execute if score #output vplib.temp matches 1.. as @a[distance=..12] run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/search_player

# Subtract grid if player was found
execute if score #found_player vplib.temp matches 1 run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/subtract_grid