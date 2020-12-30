#> vplib:custom_crafting/__ver/block/table/gui/result/changed

# Get result
data remove storage vplib:temp array
data modify storage vplib:temp array append from storage vplib:temp containerResult

# Summon inserted item at nearest player
scoreboard players set #set_owner vplib.temp 0
execute at @p positioned ~ ~0.5 ~ run function vplib:custom_crafting/__ver/block/table/general/summon_items


# Reset result slot
item block ~ ~ ~ container.16 replace minecraft:air
data remove storage vplib:temp containerResult