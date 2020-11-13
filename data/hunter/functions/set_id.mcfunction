#> hunter:set_id
#
# Sets the id of a hunter
#
# @within function hunter:start_game
# @context
#   entity any of @a[team=hunters.hunter]
#   location root

scoreboard players operation @s hunter.id = $next hunter.id
scoreboard players add $next hunter.id 1