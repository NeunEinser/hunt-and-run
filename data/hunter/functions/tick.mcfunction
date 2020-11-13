#> hunter:tick
#
# The main function that gets called every tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick
# @context root

execute if score $game_in_progress hunter.main matches 0 run function hunter:pregame_loop
execute if score $game_in_progress hunter.main matches 1 run function hunter:game_loop