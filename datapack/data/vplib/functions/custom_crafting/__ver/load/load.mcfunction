#> vplib:custom_crafting/__ver/load/load
# From: 'vplib:custom_crafting/__ver/load/resolve'
# Name: Vanilla+ Library: Custom Crafting
# Description: Universal custom crafting table implementation.
# Version: 1

# Set storage

## Current
execute store result storage vplib:data modules.custom_crafting.version.current int 1 run scoreboard players get #vplib.custom_crafting.current vplib.load

## Breaking
execute store result storage vplib:data modules.custom_crafting.version.breaking int 1 run scoreboard players get #vplib.custom_crafting.breaking vplib.load

# DEBUG Message
tellraw @a[tag=vplib.debug] [{"text":"[Debug]: ","color":"yellow","bold":true},{"text":"Loaded Vanilla+ Library: Custom Crafting __ver","color":"white","bold":false}]


# Setup
scoreboard objectives add vplib.recipe dummy


# Update recipe registry
scoreboard players reset * vplib.recipe
scoreboard players set $register vplib.recipe 0

scoreboard players set #load vplib.recipe 0
schedule function vplib:custom_crafting/__ver/load/recipes 5t replace


# Load item nbts
function vplib:custom_crafting/__ver/core/load_items