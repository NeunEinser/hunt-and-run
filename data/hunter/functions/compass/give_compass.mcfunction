#> hunter:compass/give_compass
#
# Gives a hunter a compass that tracks the runner with the location last known to the hunter
#
# @internal
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

function hunter:compass/find_player_in_storage
function hunter:compass/find_dimension_in_storage
function hunter:compass/set_shulker
execute if data storage hunter:tracking list[-1].dimensions[-1].player run function hunter:compass/set_compass_data

loot give @s mine ~ 0 ~ minecraft:compass{hunterShulkerBoxDropper: true}
setblock ~ 0 ~ minecraft:bedrock