# Vanilla+ Library: Custom Crafting

Provides a custom crafting library for data packs to use. It's designed to work as an universal crafting system, but if users don't feel like sharing the same custom crafting table, they may embed this module within their namespace and rename all storages and objectives. Recipes are completely customizable, it usually is a single mcfunction file referenced in a function tag provided by the library, it doesn't enforce what method a recipe uses to check the conditions as long as it has an output and a registered recipe ID(although the structure must follow some rules). This module has a soft dependecy for Block Placement module(i.e will work correctly if it's missing), but it is required for the vanilla gameplay, otherwise players won't be able to place the custom block.

## Requirements

- Minecraft 1.16+;
- [Vanilla+ Library: Core](https://github.com/vanilla-plus-library/core)
- [Vanilla+ Library: Block Placement(Optional)](https://github.com/vanilla-plus-library/block-placement)

## Addons
- [Vanilla+ Library: Vanilla Recipe Pack](https://github.com/vanilla-plus-library/vanilla-recipepack)
- [Vanilla+ Library: Crafting Tweaks](https://github.com/vanilla-plus-library/crafting-tweaks)

## Documentation

### Obtaining

The Universal Crafting Table can be crafted in a normal Crafting Table in the survival. Get the item by running `/loot give @s loot vplib:custom_crafting/v1/block/universal_crafting_table`(cheats required). An alternative way to place the block is running the function tag `#vplib:custom_crafting/api/table/place`.

| Ingredients                                         | Crafting Recipe                                     |
|-----------------------------------------------------|-----------------------------------------------------|
|3 Stones + 4 Planks + 1 Crafting Table + 1 Iron Ingot|<img src=https://i.imgur.com/YiqEAcl.png width="366">|

### Recipe ID

The library keeps the objective `vplib.recipe` for the users to register their recipes, inside the recipe file, you would only need a single line:
```
execute unless score <recipe-id> vplib.recipe matches 1.. store result score <recipe-id> vplib.recipe run scoreboard players add $register vplib.recipe 1
```

Each recipe will check if its ID exists, if that's not the case it will store the result of adding a global score by 1, this action will generate unique IDs for each recipe. The library will store the crafting grid to the storage path `vplib:temp recipeInput` where the recipes can check their condition from. When a recipe condition returns true(a.k.a there's a match) the recipe ID must be copied to the score `#recipe vplib.temp`, as it's shown below. With this in mind, prefer to check if a recipe has been found before checking for your condition to decrease the number of `if data` executed during this process.
```
execute if score #recipe vplib.temp matches 0 <condition> run scoreboard players operation #recipe vplib.temp = <recipe-id> vplib.recipe
```

Finally the recipe needs to check if it needs to set the output, this can be simply done by comparing the current recipe ID to the score `#recipe vplib.temp`:
```
execute if score #recipe vplib.temp = <recipe-id> vplib.recipe run data modify vplib:temp recipeOutput set value {id:"<id>",Count:<count>,tag:{<nbt>}}
```

For clarification, here's an example:
```
# Registry
execute unless score #example.emerald_shovel vplib.recipe matches 1.. store result score #example.emerald_shovel vplib.recipe run scoreboard players add $register vplib.recipe 1

# Condition
execute if score #recipe vplib.temp matches 0 if data storage vplib:temp {recipeInput:[{Slot:3b,id:"minecraft:emerald"},{Slot:12b,id:"minecraft:stick"},{Slot:21b,id:"minecraft:stick"}]} run scoreboard players operation #recipe vplib.temp = #example.emerald_shovel vplib.recipe

# Output
execute if score #recipe vplib.temp = #example.emerald_shovel vplib.recipe run data modify vplib:temp recipeOutput set value {id:"minecraft:diamond:shovel",Count:1b,tag:{Damage:0,CustomModelData:1,display:{Name:'{"text":"Emerald Shovel","italic":false}'}}}
```
**NOTE:** The recipe ID must follow this format: `#<namespace>.<recipe>`. Prefix the recipe ID with `#<namespace>.` to avoid recipes sharing the same name. It's a good practice to keep the recipe ID and the file with the same name for consistency. Also be careful to not exceed the 40 characters limit that fake players have.:

- The data pack "Improved Apiculture" adds the recipe file "white_candle.mcfunction" -> `#apiculture.white_candle`
- The data pack "A Name That Is Incredibly Long" adds the recipe file "the_most_op_item_that_ever_existed.mcfunction" -> `#antiil.most_op_item`

### Recipe function tags

Just creating the recipe file isn't enough, we need to find a way for the library to reach those files, that's easily achieved by including the function to a function tag. The recipes are separated into 10 function tags that are called based on the amount of items in the grid, the user only needs to include their function in the correct tag. This prevents the library from unnecessarily checking recipes that doesn't match the number of occupied slots in the grid. In addition, if no recipe has been found, it calls a function tag for recipes that don't have a fixed slot count, for these recipes the slot amount can checked from the score `#amount vplib.temp`(Normally you won't use this tag, but it's useful for recipes with special behaviours). The available function tags are:

- `#vplib:custom_crafting/api/table/recipes/check/1_slot`
- `#vplib:custom_crafting/api/table/recipes/check/2_slots`
- `#vplib:custom_crafting/api/table/recipes/check/3_slots`
- `#vplib:custom_crafting/api/table/recipes/check/4_slots`
- `#vplib:custom_crafting/api/table/recipes/check/5_slots`
- `#vplib:custom_crafting/api/table/recipes/check/6_slots`
- `#vplib:custom_crafting/api/table/recipes/check/7_slots`
- `#vplib:custom_crafting/api/table/recipes/check/8_slots`
- `#vplib:custom_crafting/api/table/recipes/check/9_slots`
- `#vplib:custom_crafting/api/table/recipes/check/any_slots`

### Available data when checking recipes

|Type            |Location  |Name/Path                 |Description                                      |Permission    |
|----------------|----------|--------------------------|-------------------------------------------------|--------------|
|Score/Int       |vplib:temp|#\<namespace\>.\<recipe\> |The ID of a recipe(must be unique).              |Read and write|
|Storage/List    |vplib:temp|recipeInput               |The input items(Crafting grid).                  |Read-only     |
|Storage/Compound|vplib:temp|recipeOutput              |The item output from the recipe.                 |Read and write|
|Storage/List    |vplib:temp|container                 |All the items in the container.                  |Read-only     |
|Score/Int       |vplib.temp|#recipe                   |The ID from the recipe found(0 if not found).    |Read and write|
|Score/Int       |vplib.temp|#amount                   |The amount of items in the grid.                 |Read-only     |
|Block           |~ ~ ~     |---                       |Avoid interacting directly with the block at any cost.|None     |

### Crafting Functionalities

The library calls the function tag `vplib:custom_crafting/api/table/recipes/crafted` when a crafting occurs, data packs might run a function from this tag where they check if the score `#recipe vplib.temp` matches one of the their recipe IDs and run additional commands for a specific recipe. By default, the library will consume every ingredient in the grid by 1, but if the recipe has a custom behaviour(tool durability, return empty buckets/glass bottles etc.) they can tell the library to ignore the slots by appending the slot number to the list `vplib:temp ignoredSlots`, . Here are some useful informations provided by the library for this process:

|Type            |Location  |Name/Path                 |Description                                   |Permission    |
|----------------|----------|--------------------------|----------------------------------------------|--------------|
|Storage/List    |vplib:temp|container                 |All the items in the container.               |Read-only     |
|Storage/List    |vplib:temp|containerGrid             |The items in the crafting grid.               |Read-only     |
|Storage/Compound|vplib:temp|containerResult           |The item in the result slot.                  |Read-only     |
|Storage/List    |vplib:temp|savedData.recipeInput     |The grid that triggered the current recipe.   |Read-only     |
|Storage/List    |vplib:temp|savedData.recipeOutput    |The output from the current recipe.           |Read-only     |
|Score/Int       |vplib.temp|#recipe                   |The ID from the current recipe.               |Read-only     |
|Score/Boolean   |vplib.temp|#button.craft_all         |If triggered by the craft all button          |Read-only     |
|Storage/List    |vplib:temp|ignoredSlots              |Grid slots that the library should ignore.    |Read and write     |
|Score/Int       |vplib.temp|#crafted                  |The number of craftings executed at once. Modify it to interfere in the crafting process(only works for craftings triggered by the craft all button)     |Read and write|
|Block           |~ ~ ~     |Items                     |Modify the inventory directly from the block. |Read and write|
