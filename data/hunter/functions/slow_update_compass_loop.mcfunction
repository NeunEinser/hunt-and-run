#> hunter:slow_update_compass_loop
#
# Slow loop for updating the compass
#
# @internal

execute as @a[team=hunter.hunter, nbt={SelectedItem:{id:"minecraft:compass", tag: {hunterCompass: true}}}] run function hunter:compass/update_compass

schedule function hunter:slow_update_compass_loop 5s