#> vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/check_container

# Button clicked
scoreboard players set #button_clicked vplib.temp 1

# Get grid
function vplib:custom_crafting/v1/block/table/general/get_grid

# Get result
function vplib:custom_crafting/v1/block/table/general/get_result


# Check if grid slots changed
data modify storage vplib:temp compare set from storage vplib:temp containerGrid
execute store success score #grid_changed vplib.temp run data modify storage vplib:temp compare set from storage vplib:temp savedData.recipeInput

# Check if result slot changed
data modify storage vplib:temp compare set from storage vplib:temp containerResult
scoreboard players set #result_changed vplib.temp 0
execute if score @s vplib.saved matches 1.. store success score #result_changed vplib.temp run data modify storage vplib:temp compare set from storage vplib:temp savedData.recipeOutput


# Proceed if there are no changes
execute if score #grid_changed vplib.temp matches 0 if score #result_changed vplib.temp matches 0 run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/main