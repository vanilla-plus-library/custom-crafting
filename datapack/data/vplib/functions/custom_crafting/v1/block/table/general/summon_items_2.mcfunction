#> vplib:custom_crafting/v1/block/table/general/summon_items_2

# Set item
execute if score #set_item vplib.temp matches 1 run data modify entity @s Item set from storage vplib:temp array[-1]

# Set owner
execute if score #set_owner vplib.temp matches 1 run data modify entity @s Owner set from storage vplib:temp uuid

# Set pickup delay
execute if score #set_delay vplib.temp matches 1 run data modify entity @s PickupDelay set value 0

# Remove tag
tag @s remove vplib.dropped
