## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-stop (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.animation] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-stop (3): entity denied (expected tag=egg.animation)",entity:"@s",nbt:"Tags"}

data modify storage egg:animation/-set << set from entity @s data.animation.__info
function egg:animation/-set
## Remove tags.
tag @s remove egg.animation.playing

## Success.
return 1
