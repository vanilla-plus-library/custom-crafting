#> vplib:custom_crafting/__ver/block/furnace/gui/main

# Reset scores
scoreboard players set #update_ingredient vplib.temp 0
scoreboard players set #update_result vplib.temp 0
scoreboard players set #save_data vplib.temp 0

# Move container to storage.
data modify storage vplib:temp container set from block ~ ~ ~ Items

# Get saved data(last grid and result).
data modify storage vplib:temp savedData set value {recipeInput:{},recipeOutput:{}}
data modify storage vplib:temp savedData set from entity @s Item.tag.vplib


# Get ingredient slot(input)
data modify storage vplib:temp input set value {}
data modify storage vplib:temp input set from storage vplib:temp container[{Slot:0b}]

# Check if ingredient slot changed
execute if score #update_ingredient vplib.temp matches 0 run data modify storage vplib:temp compare set from storage vplib:temp input
execute if score #update_ingredient vplib.temp matches 0 store success score #update_ingredient vplib.temp run data modify storage vplib:temp compare set from storage vplib:temp savedData.recipeInput

# Update ingredient
execute if score #update_ingredient vplib.temp matches 1 run function vplib:custom_crafting/__ver/block/furnace/gui/ingredient/update


# Save data.
execute if score #save_data vplib.temp matches 1 run data modify entity @s Item.tag.vplib set from storage vplib:temp savedData