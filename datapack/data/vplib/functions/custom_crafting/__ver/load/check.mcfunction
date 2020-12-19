#> vplib:custom_crafting/__ver/load/check

# Dependencies
scoreboard players set #load load 1

## 1.16
scoreboard players set #1.16 load 0
function vplib:core/api/version/check_1.16
execute if score #1.16 load matches 0 run scoreboard players set #load load 0

## VERSION Missing core
scoreboard players set #expected.vplib.core load 1

execute unless score #vplib.core.current load >= #expected.vplib.core load run scoreboard players set #load load -1
execute if score #vplib.core.breaking load > #expected.vplib.core load run scoreboard players set #load load -2


# Success
execute if score #load load matches 1 run function vplib:custom_crafting/__ver/load/load

# Failed

## Messages
execute if score #load load matches 0 run tellraw @a [{"text":"[Debug]: ","color":"red","bold":true},{"text":"Vanilla+ Library: Custom Crafting failed to load. It requires Minecraft 1.16+.","color":"white","bold":false}]
execute if score #load load matches -1 run tellraw @a [{"text":"[Debug]: ","color":"red","bold":true},{"text":"Vanilla+ Library: Custom Crafting failed to load. Vanilla+ Library: Core is either missing or doesn't match the minimum version(Expected: ","color":"white","bold":false},{"score":{"name":"#expected.vplib.core","objective": "load"},"color":"white","bold":false},{"text":", Got: ","color":"white","bold":false},{"score":{"name":"#vplib.core.breaking","objective": "load"},"color":"white","bold":false},{"text":").","color":"white","bold":false}]
execute if score #load load matches -2 run tellraw @a [{"text":"[Debug]: ","color":"red","bold":true},{"text":"Vanilla+ Library: Custom Crafting failed to load. Vanilla+ Library: Core version is too high and is not supported(Expected: ","color":"white","bold":false},{"score":{"name":"#expected.vplib.core","objective": "load"},"color":"white","bold":false},{"text":", Got: ","color":"white","bold":false},{"score":{"name":"#vplib.core.breaking","objective": "load"},"color":"white","bold":false},{"text":").","color":"white","bold":false}]

## Reset loaded version
execute unless score #load load matches 1 run scoreboard players reset #vplib.custom_crafting.current load
execute unless score #load load matches 1 run scoreboard players reset #vplib.custom_crafting.breaking load
execute unless score #load load matches 1 run data remove storage vplib:data modules.custom_crafting.version