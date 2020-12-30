#> vplib:custom_crafting/__ver/load/enumerate
# DEBUG
tellraw @a[tag=vplib.debug+] [{"text":"[Debug]: ","color":"yellow","bold":true},{"text":"Enumerated Vanilla+ Library: Custom Crafting __ver","color":"white","bold":false}]

# VERSION Set current version
execute unless score #vplib.custom_crafting.current vplib.load matches 2.. run scoreboard players set #vplib.custom_crafting.current vplib.load 2

# Set breaking version
execute unless score #vplib.custom_crafting.breaking vplib.load matches 2.. run scoreboard players set #vplib.custom_crafting.breaking vplib.load 2