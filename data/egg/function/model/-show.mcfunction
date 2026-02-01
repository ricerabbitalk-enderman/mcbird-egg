## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-show (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.model] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-show (3): entity denied (expected tag=egg.model)",entity:"@s",nbt:"Tags"}
execute unless data storage egg:model/-show <<looks run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-show (4): storage not found (storage egg:model/-show <<looks)",storage:"egg:model/-show",nbt:"<<looks"}

## Set data.
data modify storage egg:model/__/-loop_to_show data set from storage egg:model/-show <<looks

## Set Pose.
execute on passengers run function egg:model/__/-loop_to_show

## Success.
return 1
