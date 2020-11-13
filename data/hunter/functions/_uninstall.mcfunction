#> hunter:_uninstall
#
# Used to cleanup any scoreboards and storage data before removing this datapack from a world 
#
# @user
# @api
# @context any

scoreboard objectives remove hunter.main
scoreboard objectives remove hunter.death
scoreboard objectives remove hunter.join
scoreboard objectives remove hunter.menu

data remove storage hunter:tracking {}
schedule clear hunter:slow_update_compass_loop

tag @a remove hunter.show_menu
setblock ~ 0 ~ minecraft:bedrock
setblock ~1 0 ~ minecraft:bedrock

tellraw @s {"text": "All objectives and tags cleared. You may now remove the datapack from the world."}