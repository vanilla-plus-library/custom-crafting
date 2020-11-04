#> vplib:custom_crafting/v1/load/check

# Dependencies
scoreboard players set #load vplib.load 1

## 1.16
scoreboard players set #1.16 vplib.load 0
function vplib:core/v1/core/check_1.16
execute if score #1.16 vplib.load matches 0 run scoreboard players set #load vplib.load 0

## Missing core
scoreboard players set #expected.vplib.core vplib.load 1

execute unless score #vplib.core.current vplib.load >= #expected.vplib.core vplib.load run scoreboard players set #load vplib.load -1
execute if score #vplib.core.breaking vplib.load > #expected.vplib.core vplib.load run scoreboard players set #load vplib.load -2


# Success
execute if score #load vplib.load matches 1 run function vplib:custom_crafting/v1/load/load

# Failed

## Messages
execute if score #load vplib.load matches 0 run tellraw @a [{"text":"[Debug]: ","color":"red","bold":true},{"text":"Vanilla+ Library: Custom Crafting failed to load. It requires Minecraft 1.16+.","color":"white","bold":false}]
execute if score #load vplib.load matches -1 run tellraw @a [{"text":"[Debug]: ","color":"red","bold":true},{"text":"Vanilla+ Library: Custom Crafting failed to load. Vanilla+ Library: Core is either missing or doesn't match the minimum version(Expected: ","color":"white","bold":false},{"score":{"name":"#expected.vplib.core","objective": "vplib.load"},"color":"white","bold":false},{"text":", Got: ","color":"white","bold":false},{"score":{"name":"#vplib.core.breaking","objective": "vplib.load"},"color":"white","bold":false},{"text":").","color":"white","bold":false}]
execute if score #load vplib.load matches -2 run tellraw @a [{"text":"[Debug]: ","color":"red","bold":true},{"text":"Vanilla+ Library: Custom Crafting failed to load. Vanilla+ Library: Core version is too high and is not supported(Expected: ","color":"white","bold":false},{"score":{"name":"#expected.vplib.core","objective": "vplib.load"},"color":"white","bold":false},{"text":", Got: ","color":"white","bold":false},{"score":{"name":"#vplib.core.breaking","objective": "vplib.load"},"color":"white","bold":false},{"text":").","color":"white","bold":false}]

## Reset loaded version
execute unless score #load vplib.load matches 1 run scoreboard players reset #vplib.custom_crafting.current vplib.load
execute unless score #load vplib.load matches 1 run scoreboard players reset #vplib.custom_crafting.breaking vplib.load
execute unless score #load vplib.load matches 1 run data remove storage vplib:data modules.custom_crafting.version