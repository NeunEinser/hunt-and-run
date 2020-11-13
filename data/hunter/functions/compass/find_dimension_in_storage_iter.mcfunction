#> hunter:compass/find_dimension_in_storage_iter
# @within
#   function hunter:compass/find_dimension_in_storage
#   function hunter:compass/find_dimension_in_storage_iter
# @writes storage hunter:tracking listCpy
# @input storage hunter:tracking list[-1].dimensions[]
# @output storage hunter:tracking list[-1].listCpy[-1]
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

execute unless data storage hunter:tracking list[-1].dimensions[0] run data modify storage hunter:tracking listCpy append value {}
execute unless data storage hunter:tracking list[-1].dimensions[0] run data modify storage hunter:tracking listCpy[-1].id set from entity @s Dimension
data modify storage hunter:tracking listCpy append from storage hunter:tracking list[-1].dimensions[-1]
data remove storage hunter:tracking list[-1].dimensions[-1]

data modify storage hunter:tracking compare set from storage hunter:tracking listCpy[-1].id
execute store success score $success hunter.main run data modify storage hunter:tracking compare set from entity @s Dimension
execute if score $success hunter.main matches 1 run function hunter:compass/find_dimension_in_storage_iter