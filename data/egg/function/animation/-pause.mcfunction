## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-pause (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.animation] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-pause (3): entity denied (expected tag=egg.animation)",entity:"@s",nbt:"Tags"}

## Set scoreboards.
scoreboard players set @s egg.animation.__tick 0
## Remove tags.
tag @s remove egg.animation.__initial_point
tag @s remove egg.animation.playing

## Success.
return 1
