## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-finished (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.animation] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-finished (3): entity denied (expected tag=egg.animation)",entity:"@s",nbt:"Tags"}

## Finished.
execute if score @s egg.animation.__page = @s egg.animation.__count run return 1
## Playable.
return 0
