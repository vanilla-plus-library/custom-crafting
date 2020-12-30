#> vplib:custom_crafting/__ver/load/resolve
# DEBUG
execute unless score #vplib.custom_crafting.current vplib.load matches 2 run tellraw @a[tag=vplib.debug+] [{"text":"[Debug]: ","color":"yellow","bold":true},{"text":"Failed to resolve Vanilla+ Library: Custom Crafting __ver","color":"white","bold":false}]

# Load if lib version matches
execute if score #vplib.custom_crafting.current vplib.load matches 2 run function vplib:custom_crafting/__ver/load/check