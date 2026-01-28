## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-enable (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute if entity @s[tag=egg.model] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-enable (3): entity denied (unexpected tag=egg.model)",entity:"@s",nbt:"Tags"}

## Set data.
data modify entity @s data merge value {egg:{model:{}}}
## for Debug.
#execute run data modify entity @s data.egg.model.__debug set value {}
## Add tag.
tag @s add egg.model

## Success.
return 1