#> vplib:custom_crafting/v1/block/table/destroyed

# Drop item
execute if entity @e[type=minecraft:item,distance=..0.5,nbt={Age:0s,Item:{id:"minecraft:barrel",Count:1b}}] run loot spawn ~ ~ ~ loot vplib:custom_crafting/v1/block/universal_crafting_table
kill @e[type=minecraft:item,distance=..0.5,nbt={Age:0s,Item:{id:"minecraft:barrel",Count:1b}}]

# Kill slot holders
clear @a[distance=..8] minecraft:gray_stained_glass_pane{vplib:{slot_holder:1b}}
kill @e[type=minecraft:item,nbt={Item:{tag:{vplib:{slot_holder:1b}}}}]

# Kill result slot
data remove storage vplib:temp item
data modify storage vplib:temp item set from entity @s ArmorItems[3].tag.vplib.recipeOutput
execute if data storage vplib:temp item as @e[type=minecraft:item,distance=..1,nbt={Age:0s}] run function vplib:custom_crafting/v1/block/table/general/kill_matching_item


# Kill self
kill @s