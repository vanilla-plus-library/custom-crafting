#> vplib:custom_crafting/v1/load/recipes

# Increase
scoreboard players add #vplib.load vplib.recipe 1
execute unless score #vplib.load vplib.recipe matches 1..11 run scoreboard players reset #vplib.load vplib.recipe

# Schedule next tick
execute if score #vplib.load vplib.recipe matches 1.. run schedule function vplib:custom_crafting/v1/load/recipes 1t replace

# Reset data to run faster
data remove storage vplib:temp recipeInput
scoreboard players set #recipe vplib.temp -1
scoreboard players set #amount vplib.temp 0

# Load recipes
execute if score #vplib.load vplib.recipe matches 1 run function #vplib:custom_crafting/api/table/recipes/check/1_slot
execute if score #vplib.load vplib.recipe matches 2 run function #vplib:custom_crafting/api/table/recipes/check/2_slots
execute if score #vplib.load vplib.recipe matches 3 run function #vplib:custom_crafting/api/table/recipes/check/3_slots
execute if score #vplib.load vplib.recipe matches 4 run function #vplib:custom_crafting/api/table/recipes/check/4_slots
execute if score #vplib.load vplib.recipe matches 5 run function #vplib:custom_crafting/api/table/recipes/check/5_slots
execute if score #vplib.load vplib.recipe matches 6 run function #vplib:custom_crafting/api/table/recipes/check/6_slots
execute if score #vplib.load vplib.recipe matches 7 run function #vplib:custom_crafting/api/table/recipes/check/7_slots
execute if score #vplib.load vplib.recipe matches 8 run function #vplib:custom_crafting/api/table/recipes/check/8_slots
execute if score #vplib.load vplib.recipe matches 9 run function #vplib:custom_crafting/api/table/recipes/check/9_slots
execute if score #vplib.load vplib.recipe matches 10 run function #vplib:custom_crafting/api/table/recipes/check/any_slots
execute if score #vplib.load vplib.recipe matches 11 run function #vplib:custom_crafting/api/table/recipes/register

# Update GUIs
execute if score #vplib.load vplib.recipe matches 11 as @e[type=minecraft:armor_stand,tag=vplib.block.universal_crafting_table] at @s run function vplib:custom_crafting/v1/block/table/gui/update

# DEBUG Message
execute if score #vplib.load vplib.recipe matches 11 run tellraw @a[tag=vplib.debug] [{"text":"[Debug]: ","color":"yellow","bold":true},{"score":{"name":"$register","objective": "vplib.recipe"},"color":"white","bold":false},{"text":" recipes loaded.","color":"white","bold":false}]
