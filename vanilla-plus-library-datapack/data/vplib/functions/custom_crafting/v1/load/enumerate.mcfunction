#> vplib:custom_crafting/v1/load/enumerate

# Set current version
execute unless score #vplib.custom_crafting.current vplib.load matches 1.. run scoreboard players set #vplib.custom_crafting.current vplib.load 1

# Set breaking version
execute unless score #vplib.custom_crafting.breaking vplib.load matches 1.. run scoreboard players set #vplib.custom_crafting.breaking vplib.load 1