## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-set_pose (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.model] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-set_pose (3): entity denied (expected tag=egg.model)",entity:"@s",nbt:"Tags"}
execute unless data storage egg:model/-set_pose <<pose run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-set_pose (4): storage not found (storage egg:model/-set_pose <<pose)",storage:"egg:model/-set_pose",nbt:"<<pose"}



## Set data.
data modify storage egg:model/__/-loop_to_set_pose data set from storage egg:model/-set_pose <<pose

## Set Pose.
execute on passengers run return run function egg:model/__/-loop_to_set_pose
