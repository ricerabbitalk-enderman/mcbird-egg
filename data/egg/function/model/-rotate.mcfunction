## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-rotate (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.model] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-rotate (3): entity denied (expected tag=egg.model)",entity:"@s",nbt:"Tags"}



## Rotate.
rotate @s ~ ~
data modify storage egg:model/-rotate rotation set from entity @s Rotation
return run function egg:model/__/-loop_to_rotate
