#> vplib:custom_crafting/v1/block/table/main

# Check if it was destroyed
scoreboard players set #destroyed vplib.temp 0
execute unless block ~ ~ ~ minecraft:barrel run function vplib:custom_crafting/v1/block/table/destroyed

# Manage gui
execute if score #destroyed vplib.temp matches 0 if block ~ ~ ~ minecraft:barrel[open=true] run function vplib:custom_crafting/v1/block/table/gui/main

# Hopper lock
execute if block ~ ~-1 ~ minecraft:hopper run data modify block ~ ~-1 ~ TransferCooldown set value 24000