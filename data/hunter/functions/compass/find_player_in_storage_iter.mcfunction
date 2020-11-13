#> hunter:compass/find_player_in_storage_iter
# @within
#   function hunter:compass/find_player_in_storage
#   function hunter:compass/find_player_in_storage_iter
# @writes storage hunter:tracking listCpy tmp storage
# @input storage hunter:tracking list[]
# @output storage hunter:tracking listCpy[-1]
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

#>
#@private
#declare score_holder $cur_player_id

execute unless data storage hunter:tracking list[0] run data modify storage hunter:tracking listCpy append value {}
execute unless data storage hunter:tracking list[0] store result storage hunter:tracking listCpy[-1].id int 1 run scoreboard players get @s hunter.id
data modify storage hunter:tracking listCpy append from storage hunter:tracking list[-1]
data remove storage hunter:tracking list[-1]

execute store result score $cur_player_id hunter.main run data get storage hunter:tracking listCpy[-1].id
execute unless score @s hunter.id = $cur_player_id hunter.main run function hunter:compass/find_player_in_storage_iter