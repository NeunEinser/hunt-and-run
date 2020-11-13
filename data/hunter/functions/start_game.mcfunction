#> hunter:start_game
#
# Set all scores and prepare for game start
# @within function hunter:pregame_loop
# @context root

#>
# The next unassigned ID that's usable
# @within
#   function hunter:start_game
#   function hunter:set_id
#declare score_holder $next

scoreboard players set $game_in_progress hunter.main 1
spreadplayers ~ ~ 50 100 false @a

gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doInsomnia true
gamerule randomTickSpeed 3

weather rain 1
time set 0

effect give @a minecraft:saturation 5 255 true
effect give @a minecraft:instant_health 1 255 true

tag @a remove hunter.seen_menu
scoreboard players set @a hunter.death 0

data merge storage hunter:tracking {list: []}
scoreboard players set $next hunter.id 0
execute as @a[team=hunter.hunter] run function hunter:set_id

function hunter:slow_update_compass_loop
schedule clear hunter:slow_display_menu_loop