#> vplib:custom_crafting/v1/api/tick/1
# Name: Tick/1
# Description: Run module tick
# From: #vplib:custom_crafting/api/tick/1

# Run 'tick/1' if lib version matches
execute if score #vplib.custom_crafting.current vplib.load matches 1 run function vplib:custom_crafting/v1/tick/1