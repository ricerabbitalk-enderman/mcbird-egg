## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-transform_with_interpolation (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.model] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-transform_with_interpolation (3): entity denied (expected tag=egg.model)",entity:"@s",nbt:"Tags"}



## Set data.
execute on passengers run return run function egg:model/__/-loop_to_transform_with_interpolation
