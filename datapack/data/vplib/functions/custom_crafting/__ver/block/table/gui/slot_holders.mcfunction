#> vplib:custom_crafting/__ver/block/table/gui/slot_holders
# DEBUG tellraw @p {"score":{"name":"#slot_holders","objective":"vplib.temp"}}

# GUI Buttons

## Limit number of buttons clicked
scoreboard players set #button_clicked vplib.temp 0

## Craft all
execute if score @s vplib.data matches 1.. unless data storage vplib:temp container[{Slot:17b}] run function vplib:custom_crafting/__ver/block/table/gui/buttons/craft_all/check_container

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
execute if data storage vplib:temp array[0] at @p positioned ~ ~0.5 ~ run function vplib:custom_crafting/__ver/block/table/general/summon_items

## Kill and clear slot holder items
kill @e[type=item,nbt={Item:{tag:{vplib:{slot_holder:1b}}}}]
clear @a[distance=..8] minecraft:gray_stained_glass_pane{vplib:{slot_holder:1b}}


# Reset slot holders / Barrel name

# Default barrel name(GUI TEXTURE)
data modify storage vplib:temp json set value ['[{"translate":"space.-8","font":"space:default","color":"white"},{"text":"\\ue001","font":"vplib:custom_crafting/__ver/gui"},{"translate":"space.-172","font":"space:default"}]']

## Reset ignored slots
data remove storage vplib:temp ignoredSlots

## Third party slot holders(Let addons set custom slot holders)
function #vplib:custom_crafting/api/table/gui/slot_holders

## Set default slot holders
execute unless data storage vplib:temp {ignoredSlots:[0b]} run item replace block ~ ~ ~ container.0 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[1b]} run item replace block ~ ~ ~ container.1 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[5b]} run item replace block ~ ~ ~ container.5 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[6b]} run item replace block ~ ~ ~ container.6 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[7b]} run item replace block ~ ~ ~ container.7 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[8b]} run item replace block ~ ~ ~ container.8 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[9b]} run item replace block ~ ~ ~ container.9 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[10b]} run item replace block ~ ~ ~ container.10 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[14b]} run item replace block ~ ~ ~ container.14 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[15b]} run item replace block ~ ~ ~ container.15 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[17b]} run item replace block ~ ~ ~ container.17 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b, clickEvent: "craft_all"}, display: {Name: '{"text":"Craft all","italic":false}'}}
execute unless data storage vplib:temp {ignoredSlots:[18b]} run item replace block ~ ~ ~ container.18 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[19b]} run item replace block ~ ~ ~ container.19 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[23b]} run item replace block ~ ~ ~ container.23 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[24b]} run item replace block ~ ~ ~ container.24 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[25b]} run item replace block ~ ~ ~ container.25 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}
execute unless data storage vplib:temp {ignoredSlots:[26b]} run item replace block ~ ~ ~ container.26 with minecraft:gray_stained_glass_pane{HideFlags: 63, CustomModelData: 438900, vplib: {slot_holder: 1b, type: 1b}, display: {Name: '""'}}

## Update container
data modify storage vplib:temp container set from block ~ ~ ~ Items

## Rename barrel(RESOLVE JSON)
data modify storage vplib:temp json append value '[{"translate":"space.8","font":"space:default"},{"translate":"vplib.block.universal_crafting_table","font":"minecraft:default","color":"dark_gray"}]'
#tellraw @a {"nbt":"json","storage":"vplib:temp"}

execute positioned ~ 255 ~ run function vplib:custom_crafting/__ver/block/table/general/resolve_json
data modify block ~ ~ ~ CustomName set from storage vplib:temp resolvedJson