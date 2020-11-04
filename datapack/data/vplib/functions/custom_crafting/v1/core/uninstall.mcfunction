#> vplib:custom_crafting/v1/core/uninstall

# Objectives
scoreboard objectives remove vplib.recipe

# Clear metadata
data remove storage vplib:data modules.custom_crafting

# Clear storage
data remove storage vplib:data custom_crafting

# Clear temporary storage
function vplib:custom_crafting/v1/core/clear_temp_storage

# DEBUG Message
tellraw @a[tag=vplib.debug] [{"text":"[Debug]: ","color":"yellow","bold":true},{"text":"Uninstalled Vanilla+ Library: Custom Crafting v1","color":"white","bold":false}]