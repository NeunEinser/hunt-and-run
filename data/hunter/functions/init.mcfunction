#> hunter:init
# 
# The function that is executed on datapack load. It should only be called from tags
# Contains most definitions that are used in this datapack
# 
# @handles #minecraft:load
# @within tag/function minecraft:load
# @context root

#>
# Storage used to store the player each hunter is tracking per dimension
# @internal
#declare storage hunter:tracking

#>
# Success value of a `execute store success`
# @internal
#declare score_holder $success

#>
# Wether the game has started yet. 0=not started, 1=started
# @internal
#declare score_holder $game_in_progress

#>
# Team for Hunters
# @internal
team add hunter.hunter "Hunters"

#>
# Team for Runners
# @internal
team add hunter.runner "Runners"

team modify hunter.hunter color red
team modify hunter.runner color blue

#>
# Objective to dump all random thinks, mostly temporary stuff
# @internal
scoreboard objectives add hunter.main dummy

#>
# Objective used to detect deaths from runners
# @internal
scoreboard objectives add hunter.death deathCount

#>
# Objective used to detect players reconnecting. Used to show the game menu again
# @internal
scoreboard objectives add hunter.join minecraft.custom:minecraft.leave_game

#>
# Trigger for the pre-game menu
# @internal
scoreboard objectives add hunter.menu trigger

#>
# @internal
scoreboard objectives add hunter.id dummy

scoreboard players add $game_in_progress hunter.main 0

execute if score $game_in_progress hunter.main matches 0 run function hunter:setup_pregame
execute if score $game_in_progress hunter.main matches 0 run function hunter:slow_display_menu_loop
execute if score $game_in_progress hunter.main matches 1 run function hunter:slow_update_compass_loop