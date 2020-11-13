#> hunter:compass/update_compass
#
# Updates the compass of the hunter to the nearest player, or sets it to the last known player if none is found.
#
# @internal
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

function hunter:compass/get_nearest_player
function hunter:compass/set_shulker
execute if data storage hunter:tracking list[-1].dimensions[-1].player run function hunter:compass/set_compass_data

loot replace entity @s weapon.mainhand 1 mine ~ 0 ~ minecraft:compass{hunterShulkerBoxDropper: true}
setblock ~ 0 ~ minecraft:bedrock