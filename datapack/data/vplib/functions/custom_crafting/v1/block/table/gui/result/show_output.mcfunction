#> vplib:custom_crafting/v1/block/table/gui/result/show_output

# Set result slot holder
replaceitem block ~ ~ ~ container.16 minecraft:gray_stained_glass_pane{HideFlags:63,CustomModelData:438900,vplib:{slot_holder:1b,type:2b},display:{Name:'{"text":""}'}}

# Get item
data modify storage vplib:temp item set from storage vplib:temp savedData.recipeOutput
data modify storage vplib:temp item.Slot set value 16b

# Set recipe output
execute if data storage vplib:temp item.id run data modify block ~ ~ ~ Items[{Slot:16b}] set from storage vplib:temp item

# DEBUG Show output
#say Updated result.
#tellraw @a ["Showing result: ",{"nbt":"item","storage":"vplib:temp"}]