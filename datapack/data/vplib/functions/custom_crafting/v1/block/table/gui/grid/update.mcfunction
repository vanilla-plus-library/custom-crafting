#> vplib:custom_crafting/v1/block/table/gui/grid/update

# Prepare
scoreboard players set #recipe vplib.temp 0
data modify storage vplib:temp recipeOutput set value {}

# Call recipes if there's at least one item in the grid
execute if data storage vplib:temp containerGrid[0] run function vplib:custom_crafting/v1/block/table/gui/grid/recipes

# DEBUG Grid update
#say Updated grid.
#tellraw @a ["Last Output:",{"nbt":"savedData.recipeOutput","storage":"vplib:temp"}]
#tellraw @a ["Current Output:",{"nbt":"recipeOutput","storage":"vplib:temp"}]
#tellraw @a ["Last id:",{"score":{"name":"@s","objective": "vplib.data"}},"  Current id:",{"score":{"name":"#recipe","objective": "vplib.temp"}}]


# Save result
data remove storage vplib:temp recipeOutput.Slot
data modify storage vplib:temp savedData.recipeOutput set from storage vplib:temp recipeOutput

# Check if recipe changed
execute if score @s vplib.data matches 1.. if score #recipe vplib.temp matches 1.. run tag @s add vplib.recipe_changed

# Update score
scoreboard players operation @s vplib.data = #recipe vplib.temp


# Save grid
data modify storage vplib:temp savedData.recipeInput set from storage vplib:temp containerGrid


# Force updates
scoreboard players set #update_result vplib.temp 1
scoreboard players set #save_data vplib.temp 1


