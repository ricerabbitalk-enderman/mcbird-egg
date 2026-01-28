## Skip initial point.
execute if entity @s[tag=egg.animation.__initial_point] run return run tag @s remove egg.animation.__initial_point

## Pop.
execute unless function egg:animation/__/-pop run return run function egg:animation/__/-next_page
## Set pose.
function egg:model/-set_pose
## Enable interpolation.
function egg:model/-transform_with_interpolation

## Success.
return 1
