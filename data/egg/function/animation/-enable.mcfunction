## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-enable (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute if entity @s[tag=egg.animation] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-enable (3): entity denied (unexpected tag=egg.animation)",entity:"@s",nbt:"Tags"}





## Set scoreboards.
scoreboard players set @s egg.animation.__tick 0
scoreboard players set @s egg.animation.__page 0
scoreboard players set @s egg.animation.__count 0
scoreboard players set @s egg.animation.__repeat 0
## Set data.
data modify entity @s data merge value {egg:{animation:{}}}
## for Debug.
#data modify entity @s data.egg.animation.__debug set value {}
## Add tags.
tag @s add egg.animation

## Success.
return 1
