#> hunter:compass/find_player_in_storage
#
# Moves current player (entity @s) of list[] to index -1 and creates an entry if not present
#
# @within function hunter:compass/**
# @input storage hunter:tracking list[-1].dimensions[]
# @output storage hunter:tracking list[-1].dimensions[-1]
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

function hunter:compass/find_player_in_storage_iter
data modify storage hunter:tracking list append from storage hunter:tracking listCpy[]
data remove storage hunter:tracking listCpy