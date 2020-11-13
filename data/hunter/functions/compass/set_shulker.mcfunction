#> hunter:compass/set_shulker
#
# Sets a shulkerbox at y=0 below world spawn
#
# @within function hunter:compass/**
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

setblock ~ 0 ~ minecraft:shulker_box{Items:[{id:"minecraft:compass", Count: 1b, Slot: 0b, tag:{hunterCompass: true, LodestoneDimension:"hunter:non_existant", LodestonePos:{X: 0, Y: 0, Z:0}, LodestoneTracked: false, display:{Name:'{"text": "Could not find any player in current dimension", "color": "gray", "italic": true}'}}}]}