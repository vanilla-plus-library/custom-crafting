#> vplib:custom_crafting/__ver/block/table/gui/grid/recipes
#say Checking recipes.

# Move container input
data modify storage vplib:temp recipeInput set from storage vplib:temp containerGrid

# Get amount of items in the grid
execute store result score #amount vplib.temp if data storage vplib:temp recipeInput[]

# Check recipes based on the amount of items(improves performance)
execute if score #amount vplib.temp matches 1 run function #vplib:custom_crafting/api/table/recipes/1_slot
execute if score #amount vplib.temp matches 2 run function #vplib:custom_crafting/api/table/recipes/2_slots
execute if score #amount vplib.temp matches 3 run function #vplib:custom_crafting/api/table/recipes/3_slots
execute if score #amount vplib.temp matches 4 run function #vplib:custom_crafting/api/table/recipes/4_slots
execute if score #amount vplib.temp matches 5 run function #vplib:custom_crafting/api/table/recipes/5_slots
execute if score #amount vplib.temp matches 6 run function #vplib:custom_crafting/api/table/recipes/6_slots
execute if score #amount vplib.temp matches 7 run function #vplib:custom_crafting/api/table/recipes/7_slots
execute if score #amount vplib.temp matches 8 run function #vplib:custom_crafting/api/table/recipes/8_slots
execute if score #amount vplib.temp matches 9 run function #vplib:custom_crafting/api/table/recipes/9_slots
execute if score #recipe vplib.temp matches 0 run function #vplib:custom_crafting/api/table/recipes/any_slots