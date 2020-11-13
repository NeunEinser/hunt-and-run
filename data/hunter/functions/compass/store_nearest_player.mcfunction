#> hunter:compass/store_nearest_player
#
# Finds closesd player and updates list[-1].dimension[-1]
#
# @within function hunter:compass/get_nearest_player
# @output storage hunter:tracking list[-1].dimension[-1]
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

setblock ~ 0 ~ minecraft:oak_wall_sign{Text1: '{"selector": "@a[limit=1, tag=hunter.nearest]"}'}
data modify storage hunter:tracking list[-1].dimensions[-1].player set from block ~ 0 ~ Text1
setblock ~ 0 ~ minecraft:bedrock

data modify storage hunter:tracking list[-1].dimensions[-1].success set value true
execute store result storage hunter:tracking list[-1].dimensions[-1].pos.X int 1 run data get entity @a[limit=1, tag=hunter.nearest] Pos[0]
execute store result storage hunter:tracking list[-1].dimensions[-1].pos.Y int 1 run data get entity @a[limit=1, tag=hunter.nearest] Pos[1]
execute store result storage hunter:tracking list[-1].dimensions[-1].pos.Z int 1 run data get entity @a[limit=1, tag=hunter.nearest] Pos[2]