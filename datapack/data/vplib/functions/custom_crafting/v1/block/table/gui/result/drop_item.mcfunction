#> vplib:custom_crafting/v1/block/table/gui/result/drop_item
#tellraw @a "Replacing result holder"

# Get result
data remove storage vplib:temp array
data modify storage vplib:temp array append from storage vplib:temp containerResult

# Summon inserted item at nearest player
scoreboard players set #set_owner vplib.temp 0
execute if data storage vplib:temp array[0] at @p positioned ~ ~0.5 ~ run function vplib:custom_crafting/v1/block/table/general/summon_items

# Kill and clear slot holder items
kill @e[type=item,nbt={Item:{tag:{vplib:{slot_holder:1b}}}}]
clear @a[distance=..8] minecraft:gray_stained_glass_pane{vplib:{slot_holder:1b}}


# Set result slot holder
replaceitem block ~ ~ ~ container.16 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:2b},display:{Name:'{"text":""}'}}