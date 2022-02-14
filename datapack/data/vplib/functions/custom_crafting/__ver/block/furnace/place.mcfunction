#> vplib:custom_crafting/__ver/block/furnace/place

# Unless the block is already marked
execute unless entity @e[type=minecraft:item_frame,tag=vplib.block.furnace,distance=..0.5,limit=1] run function vplib:custom_crafting/__ver/block/furnace/place2