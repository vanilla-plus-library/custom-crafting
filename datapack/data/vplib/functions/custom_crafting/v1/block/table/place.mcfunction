#> vplib:custom_crafting/v1/block/table/place

# Sound
execute at @s run playsound minecraft:block.wood.place block @a ~ ~ ~ 1 0.8

# Summon armor stand
execute align xyz run summon minecraft:armor_stand ~0.5 ~0.5 ~0.5 {NoGravity:1b,Marker:1b,Invisible:1b,Small:1b,Tags:["global.ignore","global.ignore.kill","global.ignore.pos","vplib.block.universal_crafting_table"],ArmorItems:[{},{},{},{id:"minecraft:gray_stained_glass_pane",Count:1b,tag:{CustomModelData:438901}}]}

# Set barrel
setblock ~ ~ ~ minecraft:barrel[facing=up]{CustomName:'[{"translate":"vplib.gui.universal_crafting_table","font":"vplib:custom_crafting/v1/gui","color":"white","italic":false,"bold":false},{"translate":"vplib.block.universal_crafting_table","font":"minecraft:default","color":"dark_gray"}]'}

# Update
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=armor_stand,tag=vplib.block.universal_crafting_table,limit=1,sort=nearest] run function vplib:custom_crafting/v1/block/table/gui/main