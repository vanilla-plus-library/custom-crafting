#> vplib:custom_crafting/v1/block/table/gui/result/compare
#tellraw @a ["Comparing container slot:",{"nbt":"containerResult","storage": "vplib:temp"}]
#tellraw @a ["Comparing recipe output:",{"nbt":"savedData.recipeOutput","storage": "vplib:temp"}]

# Get slot in container
data modify storage vplib:temp compare set from storage vplib:temp containerResult

# Compare with recipe output
execute store success score #result_changed vplib.temp run data modify storage vplib:temp compare set from storage vplib:temp savedData.recipeOutput

# Proceed if item changed
execute if score #result_changed vplib.temp matches 1 run function vplib:custom_crafting/v1/block/table/gui/result/changed