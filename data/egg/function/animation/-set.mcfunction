## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-set (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.animation] run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-set (3): entity denied (expected tag=egg.animation)",entity:"@s",nbt:"Tags"}
execute unless data storage egg:animation/-set <<.repeat run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-set (4): storage not found (storage egg:animation/-set <<.repeat)",storage:"egg:animation/-set",nbt:"<<.repeat"}
execute unless data storage egg:animation/-set <<.path run return run function egg:__/error/throw {message:"[ERROR] function egg:animation/-set (5): storage not found (storage egg:animation/-set <<.path)",storage:"egg:animation/-set",nbt:"<<.path"}

## Get information.
data modify entity @s data.egg.animation.__info set from storage egg:animation/-set <<

## Set scoreboards.
scoreboard players set @s egg.animation.__tick 0
scoreboard players set @s egg.animation.__page 0
scoreboard players set @s egg.animation.__repeat 0
scoreboard players set @s egg.animation.__count 0
execute store result score @s egg.animation.__repeat run data get storage egg:animation/-set <<.repeat
execute store result score @s egg.animation.__count run function egg:animation/__/macro/-get_count with storage egg:animation/-set <<
## Remove tags.
tag @s remove egg.animation.__initial_point
tag @s remove egg.animation.playing

## Get timeline.
function egg:animation/__/-get_timeline

return 1
