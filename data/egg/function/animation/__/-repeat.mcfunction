## Check finish.
execute if score @s egg.animation.__repeat matches 0 run return 0
## Update repeat count.
execute if score @s egg.animation.__repeat matches 1.. run scoreboard players remove @s egg.animation.__repeat 1
## Reset page.
scoreboard players set @s egg.animation.__page 0
## Get timeline.
function egg:animation/__/-get_timeline
## Pop.
function egg:animation/__/-pop
## Set pose.
function egg:model/-set_pose
## Disable interpolation.
function egg:model/-transform_without_interpolation
## Add tags.
tag @s add egg.animation.__initial_point

## Success.
return 1