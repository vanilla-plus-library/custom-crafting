#> vplib:custom_crafting/v1/block/table/general/summon_items
# Description: Summon dropped items.
# Input: 'vplib:temp array' / Position

# Summon
summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},Tags:["vplib.dropped"]}

# Store item
scoreboard players set #set_item vplib.temp 1
scoreboard players set #set_delay vplib.temp 0
execute as @e[type=item,tag=vplib.dropped,limit=1] run function vplib:custom_crafting/v1/block/table/general/summon_items_2

# Loop
data remove storage vplib:temp array[-1]
execute if data storage vplib:temp array[-1] run function vplib:custom_crafting/v1/block/table/general/summon_items