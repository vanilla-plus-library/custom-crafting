#> vplib:custom_crafting/__ver/block/furnace/gui/ingredient/recipes
#say Checking recipes.

# Move container input
data remove storage vplib:temp recipeInput
data modify storage vplib:temp recipeInput set from storage vplib:temp input

# Check recipes
function #vplib:custom_crafting/api/furnace/recipes