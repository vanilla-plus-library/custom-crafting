#> vplib:custom_crafting/v1/block/table/gui/slot_holders
# DEBUG tellraw @p {"score":{"name":"#slot_holders","objective":"vplib.temp"}}

# GUI Buttons

## Limit number of buttons clicked
scoreboard players set #button_clicked vplib.temp 0

## Craft all
execute if score @s vplib.data matches 1.. unless data storage vplib:temp container[{Slot:17b}] run function vplib:custom_crafting/v1/block/table/gui/buttons/craft_all/check_container

## Third party buttons(Let addons perform custom buttons)
function #vplib:custom_crafting/api/table/gui/buttons


# Drop inserted items

## Move container to temp array
data modify storage vplib:temp array set from storage vplib:temp container

## Remove slot holders
data remove storage vplib:temp array[{tag:{vplib:{slot_holder:1b,type:1b}}}]

## Remove grid
data remove storage vplib:temp array[{Slot:2b}]
data remove storage vplib:temp array[{Slot:3b}]
data remove storage vplib:temp array[{Slot:4b}]
data remove storage vplib:temp array[{Slot:11b}]
data remove storage vplib:temp array[{Slot:12b}]
data remove storage vplib:temp array[{Slot:13b}]
data remove storage vplib:temp array[{Slot:20b}]
data remove storage vplib:temp array[{Slot:21b}]
data remove storage vplib:temp array[{Slot:22b}]

## Remove output
data remove storage vplib:temp array[{Slot:16b}]

## Summon items at nearest player
scoreboard players set #set_owner vplib.temp 0
execute if data storage vplib:temp array[0] at @p positioned ~ ~0.5 ~ run function vplib:custom_crafting/v1/block/table/general/summon_items

## Kill and clear slot holder items
kill @e[type=item,nbt={Item:{tag:{vplib:{slot_holder:1b}}}}]
clear @a[distance=..8] minecraft:gray_stained_glass_pane{vplib:{slot_holder:1b}}


# Reset slot holders / Barrel name

# Default barrel name(GUI TEXTURE)
data modify storage vplib:temp json set value ['[{"translate":"space.-8","font":"space:default","color":"white"},{"text":"\\ue001","font":"vplib:custom_crafting/v1/gui"},{"translate":"space.-172","font":"space:default"}]']

## Reset ignored slots
data remove storage vplib:temp ignoredSlots

## Third party slot holders(Let addons set custom slot holders)
function #vplib:custom_crafting/api/table/gui/slot_holders

## Set default slot holders
execute unless data storage vplib:temp {ignoredSlots:[0b]} run replaceitem block ~ ~ ~ container.0 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[1b]} run replaceitem block ~ ~ ~ container.1 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[5b]} run replaceitem block ~ ~ ~ container.5 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[6b]} run replaceitem block ~ ~ ~ container.6 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[7b]} run replaceitem block ~ ~ ~ container.7 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[8b]} run replaceitem block ~ ~ ~ container.8 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[9b]} run replaceitem block ~ ~ ~ container.9 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[10b]} run replaceitem block ~ ~ ~ container.10 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[14b]} run replaceitem block ~ ~ ~ container.14 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[15b]} run replaceitem block ~ ~ ~ container.15 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[17b]} run replaceitem block ~ ~ ~ container.17 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b,clickEvent:"craft_all"},display:{Name:'{"text":"Craft all","italic":false}'}}
execute unless data storage vplib:temp {ignoredSlots:[18b]} run replaceitem block ~ ~ ~ container.18 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[19b]} run replaceitem block ~ ~ ~ container.19 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[23b]} run replaceitem block ~ ~ ~ container.23 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[24b]} run replaceitem block ~ ~ ~ container.24 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[25b]} run replaceitem block ~ ~ ~ container.25 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}
execute unless data storage vplib:temp {ignoredSlots:[26b]} run replaceitem block ~ ~ ~ container.26 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:1b},display:{Name:'""'}}

## Update container
data modify storage vplib:temp container set from block ~ ~ ~ Items

## Rename barrel(RESOLVE JSON)
data modify storage vplib:temp json append value '[{"translate":"space.8","font":"space:default"},{"translate":"vplib.block.universal_crafting_table","font":"minecraft:default","color":"dark_gray"}]'
#tellraw @a {"nbt":"json","storage":"vplib:temp"}

execute positioned ~ 255 ~ run function vplib:custom_crafting/v1/block/table/general/resolve_json
data modify block ~ ~ ~ CustomName set from storage vplib:temp resolvedJson