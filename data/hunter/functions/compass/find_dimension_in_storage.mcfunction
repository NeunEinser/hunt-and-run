#> hunter:compass/find_dimension_in_storage
#
# Moves current dimension (entity @s nbt Dimnesion) of list[-1].dimensions[] to index -1 and creates an entry if not present
#
# @within function hunter:compass/**
# @input
#   storage hunter:tracking list[-1].dimensions[]
#   score $set_success hunter.main
#       Wether this invocation should set the success value of the dimension to false. 1=true, 0=false. Default is 0.
# @output storage hunter:tracking list[-1].dimensions[-1]
# @context
#   entity any of @a[team=hunter.hunter]
#   location root

#>
# Wether the invocation of this function should set the success value of the dimension to false. 1=true, 0=false. Default is 0.
# @internal
#declare score_holder $set_success

function hunter:compass/find_dimension_in_storage_iter
data modify storage hunter:tracking list[-1].dimensions append from storage hunter:tracking listCpy[]
data remove storage hunter:tracking listCpy
execute if score $set_success hunter.main matches 1 run data modify storage hunter:tracking list[-1].dimensions[-1].success set value false