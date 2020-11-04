#> vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/search_player

# Reset score
scoreboard players set #clicked vplib.temp 0

# Check if clicked
execute store success score #clicked vplib.temp run clear @s minecraft:gray_stained_glass_pane{vplib:{clickEvent:"craft_all"}} 0

# Check if shift clicked
#execute if score #clicked vplib.temp matches 1 if data entity @s Inventory[{tag:{vplib:{clickEvent:"craft_all"}}}] run scoreboard players set #clicked vplib.temp 2

# Proceed if true
execute if score #found_player vplib.temp matches 0 if score #clicked vplib.temp matches 1.. at @s run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/give








