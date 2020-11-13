#> hunter:compass/set_compass_data
#
# Prepares the compass for the current player and puts it into a shulkerbox at y=0 below the worldspawn
#
# @within function hunter:compass/**
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

data modify block ~ 0 ~ Items[0].tag.LodestoneDimension set from storage hunter:tracking list[-1].dimensions[-1].id
data modify block ~ 0 ~ Items[0].tag.LodestonePos set from storage hunter:tracking list[-1].dimensions[-1].pos

execute store result score $success hunter.main run data get storage hunter:tracking list[-1].dimensions[-1].success

setblock ~1 0 ~ minecraft:oak_wall_sign{Text1:'["Could not find any player in current dimension. Using last known location from ", {"storage": "hunter:tracking", "nbt": "list[-1].dimensions[-1].player", "interpret": true}]'}
execute if score $success hunter.main matches 1 run data modify block ~1 0 ~ Text1 set value '["Tracking player ", {"storage": "hunter:tracking", "nbt": "list[-1].dimensions[-1].player", "interpret": true}]'

data modify block ~ 0 ~ Items[0].tag.display.Name set from block ~1 0 ~ Text1

setblock ~1 0 ~ minecraft:bedrock