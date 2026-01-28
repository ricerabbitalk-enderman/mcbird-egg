## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-play (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.animation] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-play (3): entity denied (expected tag=egg.animation)",entity:"@s",nbt:"Tags"}

## Pop.
function egg:animation/__/-pop
## Set pose.
function egg:model/-set_pose
## Disable interpolation.
function egg:model/-transform_without_interpolation
## Add tags.
tag @s add egg.animation.__initial_point
tag @s add egg.animation.playing

## Success.
return 1
