#> vplib:custom_crafting/__ver/block/furnace/main

# Destroy
execute unless block ~ ~ ~ minecraft:furnace run function vplib:custom_crafting/__ver/block/furnace/destroy

# Gui
execute if entity @s[tag=vplib.has_ingredient] run function vplib:custom_crafting/__ver/block/furnace/gui/main

tag @s remove vplib.has_ingredient
execute if data block ~ ~ ~ Items[{Slot:0b}] run tag @s add vplib.has_ingredient

#particle smoke ~ ~ ~ 0.3 0.3 0.3 0.005 1 normal