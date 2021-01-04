#> vplib:custom_crafting/__ver/tick/1

# Store gametime(Useful when debugging)
#execute store result score #gametime vplib.data run time query gametime

# As blocks
execute as @e[type=#vplib:block_placement/__ver/block_marker,tag=vplib.block] at @s run function vplib:custom_crafting/__ver/block/tick/1