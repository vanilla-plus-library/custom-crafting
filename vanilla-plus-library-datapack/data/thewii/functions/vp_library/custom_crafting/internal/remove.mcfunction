#> thewii:vp_library/custom_crafting/internal/remove

scoreboard players set #dependencies twvp.temp 0
execute store result score #dependencies twvp.temp run data get storage thewii:vp_library/data modules.custom_crafting

execute if score #dependencies twvp.temp matches ..0 run scoreboard players set #dependencies twvp.temp 1
execute store result storage thewii:vp_library/data modules.custom_crafting int 1 run scoreboard players remove #dependencies twvp.temp 1


execute if score #dependencies twvp.temp matches ..0 run function thewii:vp_library/custom_crafting/internal/uninstall
execute if score #dependencies twvp.temp matches ..0 run data remove storage thewii:vp_library/data modules.custom_crafting

function thewii:vp_library/core/check_uninstall