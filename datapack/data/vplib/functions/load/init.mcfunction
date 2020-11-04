#> vplib:load/init
# Description: Initialize versioning objective and load core module.
# From: '#vplib:core/load/init(#minecraft:load)'

# Add Objective
scoreboard objectives add vplib.load dummy

# Reset objective
scoreboard players reset * vplib.load

# Enumerate core
function #vplib:core/api/load/enumerate

# Resolve core
function #vplib:core/api/load/resolve