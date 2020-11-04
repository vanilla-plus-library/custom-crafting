#> vplib:custom_crafting/v1/load/resolve
# DEBUG
execute unless score #vplib.custom_crafting.current vplib.load matches 1 run tellraw @a[tag=vplib.debug+] [{"text":"[Debug]: ","color":"yellow","bold":true},{"text":"Failed to resolve Vanilla+ Library: Custom Crafting v1","color":"white","bold":false}]

# Load if lib version matches
execute if score #vplib.custom_crafting.current vplib.load matches 1 run function vplib:custom_crafting/v1/load/check