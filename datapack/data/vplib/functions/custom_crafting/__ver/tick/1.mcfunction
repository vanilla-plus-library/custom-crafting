#> vplib:custom_crafting/__ver/tick/1

# Store gametime(Useful when debugging)
#execute store result score #gametime vplib.data run time query gametime

# As blocks
execute as @e[type=minecraft:armor_stand,tag=vplib.block.universal_crafting_table] at @s run function vplib:custom_crafting/__ver/block/table/main