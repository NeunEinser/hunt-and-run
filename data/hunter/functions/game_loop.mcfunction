#> hunter:game_loop
#
# Function that is run when the game is in progress
#
# @within function hunter:tick
# @context root

#execute unless entity @a[limit=1, gamemode=!spectator, team=hunter.runner] run title @a title ["The ", {"text": "Hunters", "color": "red"}, " won!"]
#execute in minecraft:the_end if entity @a[limit=1, gamemode=!spectator, distance=0..] unless entity @e[type=minecraft:ender_dragon] run title @a title ["The ", {"text": "Runners", "color": "blue"}, " won!"]

gamemode spectator @a[team=hunter.runner, scores={hunter.death=1..}]
scoreboard players set @a hunter.death 0

execute as @a[team=hunter.hunter] store success score @s hunter.main run clear @s minecraft:compass{hunterCompass: true} 0
execute as @a[team=hunter.hunter, scores={hunter.main=0}] run function hunter:compass/give_compass
kill @e[type=minecraft:item, nbt={Item:{tag:{hunterCompass: true}}}]