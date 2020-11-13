#> hunter:pregame_loop
#
# Function that is run when the game is in progress
#
# @within function hunter:tick
# @context root

tellraw @a[scores={hunter.menu=1}] ["", {"text": "Hunter", "color": "red"}, ": As a hunter your goal is to chase and kill all runners. You will receive a compass that points you to the nearest runner. You may die as many times as you \"want\". You can use beds to set your spawnpoint like normally.\n\n", {"text": "Runner", "color": "blue"}, ": As a runner, your goal is to kill the ender dragon. You only have one live and once you die, may it be by mishaps in the game, or by getting killed from a hunter, you are out.\n\nThe game ends once either all runners or the ender dragon died."]
team join hunter.hunter @a[scores={hunter.menu=2}]
tellraw @a[scores={hunter.menu=2}] ["Successfully joined the ", {"text": "Hunters", "color": "red"}]
team join hunter.runner @a[scores={hunter.menu=3}]
tellraw @a[scores={hunter.menu=3}] ["Successfully joined the ", {"text": "Runners", "color": "blue"}]

execute if entity @a[limit=1, scores={hunter.menu=4}] if entity @a[limit=1, team=hunter.hunter] if entity @a[limit=1, team=hunter.runner] unless entity @a[limit=1, team=!hunter.hunter, team=!hunter.runner, gamemode=survival] run function hunter:start_game
execute unless entity @a[limit=1, team=hunter.hunter] run tellraw @a[scores={hunter.menu=4..5}] {"text": "Both teams need at least one player!", "color": "red"}
execute unless entity @a[limit=1, team=hunter.runner] run tellraw @a[scores={hunter.menu=4..5}] {"text": "Both teams need at least one player!", "color": "red"}
execute if entity @a[limit=1, team=hunter.hunter] if entity @a[limit=1, team=hunter.runner] if entity @a[limit=1, team=!hunter.hunter, team=!hunter.runner, gamemode=survival] run tellraw @a[scores={hunter.menu=4}] [{"selector": "@a[team=!hunter.hunter, team=!hunter.runner, gamemode=survival]"}, " did not join any team yet. These players will automatically be put in spectator mode.\n\n", {"text": "[", "clickEvent": {"action": "run_command", "value": "/trigger hunter.menu set 5"}, "extra": [{"text": "Start anyway", "color": "gray"}, "]\n"]}, {"text": "[", "clickEvent": {"action": "run_command", "value": "/trigger hunter.menu set 6"}, "extra": [{"text": "Cancel", "color": "green"}, "]"]}]

execute if entity @a[limit=1, scores={hunter.menu=5}] if entity @a[limit=1, team=hunter.hunter] if entity @a[limit=1, team=hunter.runner] run function hunter:start_game

scoreboard players reset @a hunter.menu
scoreboard players enable @a hunter.menu

tag @a[scores={hunter.join=1..}] remove hunter.seen_menu
tag @a[scores={hunter.menu=6}] remove hunter.seen_menu
tellraw @a[tag=!hunter.seen_menu] ["\n\n\n\n\n\n\n\n\nWelcome to Hunt & Run!\n\n", {"text": "[", "clickEvent": {"action": "run_command", "value": "/trigger hunter.menu set 1"}, "extra": [{"text": "How to play", "color": "green"}, "]\n"]}, {"text": "[", "clickEvent": {"action": "run_command", "value": "/trigger hunter.menu set 2"}, "extra": [{"text": "Join the ", "color": "green"}, {"text": "Hunters", "color": "red"}, "]\n"]}, {"text": "[", "clickEvent": {"action": "run_command", "value": "/trigger hunter.menu set 3"}, "extra": [{"text": "Join the ", "color": "green"}, {"text": "Runners", "color": "blue"}, "]\n"]}, {"text": "[", "clickEvent": {"action": "run_command", "value": "/trigger hunter.menu set 4"}, "extra": [{"text": "Start the game", "color": "green"}, "]"]}]

tag @a add hunter.seen_menu
scoreboard players set @a hunter.join 0