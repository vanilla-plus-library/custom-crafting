#> vplib:custom_crafting/v1/block/table/general/resolve_json
# Description: Transform an array of jsons components into a single json text
# Input: vplib:temp array / At a empty block to set sign
# Output: vplib:temp resolvedJson


# Sign
setblock ~ ~ ~ minecraft:oak_sign

# Loop
function vplib:custom_crafting/v1/block/table/general/resolve_json_2

# Result
data modify storage vplib:temp resolvedJson set from block ~ ~ ~ Text1

# Remove sign
setblock ~ ~ ~ minecraft:air