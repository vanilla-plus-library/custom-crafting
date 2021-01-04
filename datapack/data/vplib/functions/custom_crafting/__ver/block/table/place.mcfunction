#> vplib:custom_crafting/__ver/block/table/place

# Sound
execute at @s run playsound minecraft:block.wood.place block @a ~ ~ ~ 1 0.8

# Summon armor stand
execute align xyz run summon minecraft:armor_stand ~0.5 ~0.5 ~0.5 {NoGravity:1b,Marker:1b,Invisible:1b,Small:1b,Tags:["global.ignore","global.ignore.kill","global.ignore.pos","vplib.block","vplib.block.universal_crafting_table"],ArmorItems:[{},{},{},{id:"minecraft:gray_stained_glass_pane",Count:1b,tag:{CustomModelData:438901}}]}

# Set barrel
setblock ~ ~ ~ minecraft:barrel[facing=up]

# Update
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=armor_stand,tag=vplib.block.universal_crafting_table,limit=1,sort=nearest] run function vplib:custom_crafting/__ver/block/table/gui/main