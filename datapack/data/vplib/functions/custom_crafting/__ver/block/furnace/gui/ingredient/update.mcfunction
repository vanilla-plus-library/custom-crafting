#> vplib:custom_crafting/__ver/block/furnace/gui/ingredient/update

# Get cook time
execute store result score #cook_time vplib.temp run data get block ~ ~ ~ CookTime

# Get lit
execute store success score #lit vplib.temp if block ~ ~ ~ #vplib:block_placement/__ver/furnaces[lit=true]


# Prepare
scoreboard players set #recipe vplib.temp 0
data modify storage vplib:temp recipeOutput set value {}

# Check recipes if there's an ingredient
execute if data storage vplib:temp input.id run function vplib:custom_crafting/__ver/block/furnace/gui/ingredient/recipes

# DEBUG Grid update
#tellraw @a ["Cook Time:",{"nbt":"CookTime","block":"~ ~ ~"}]
#tellraw @a ["Current Output:",{"nbt":"recipeOutput","storage":"vplib:temp"}]
#tellraw @a ["Last id:",{"score":{"name":"@s","objective": "vplib.data"}},"  Current id:",{"score":{"name":"#recipe","objective": "vplib.temp"}}]


# Save result
data remove storage vplib:temp recipeOutput.Slot
data modify storage vplib:temp savedData.recipeOutput set from storage vplib:temp recipeOutput

# Update score
scoreboard players operation @s vplib.data = #recipe vplib.temp


# Save grid
data modify storage vplib:temp savedData.recipeInput set from storage vplib:temp input


# Force updates
scoreboard players set #save_data vplib.temp 1


