#> hunter:compass/get_nearest_player
#
# Puts storage data of current player into hunter:tracking list[-1].dimension[-1].
# Attempts to find the closed player and overwrite the cached data for the dimension.
# If no player is found, `success` will be set to false for the cached dimension,
# and last known player and their location will be stored instead.
#
# @within function hunter:compass/**
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

function hunter:compass/find_player_in_storage

scoreboard players set $set_success hunter.main 1
function hunter:compass/find_dimension_in_storage
scoreboard players reset $set_success hunter.main

execute at @s run tag @a[limit=1, distance=0.., team=hunter.runner, gamemode=!spectator, sort=nearest] add hunter.nearest
execute if entity @a[limit=1, tag=hunter.nearest] run function hunter:compass/store_nearest_player
tag @a remove hunter.nearest
