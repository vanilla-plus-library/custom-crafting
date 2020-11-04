#> vplib:custom_crafting/v1/block/table/general/resolve_json_2

# Append
data modify block ~ ~ ~ Text1 set value '[{"nbt":"Text1","block":"~ ~ ~","interpret":true},{"nbt":"json[0]","storage":"vplib:temp","interpret":true}]'

# Loop
data remove storage vplib:temp json[0]
execute if data storage vplib:temp json[0] run function vplib:custom_crafting/v1/block/table/general/resolve_json_2