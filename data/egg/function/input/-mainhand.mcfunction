## Verify.
execute unless entity @s[type=minecraft:player] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-mainhand (2): entity denied (expected type=minecraft:player)",selector:"@s"}
execute unless entity @s[tag=egg.input] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-mainhand (3): entity denied (expected tag=egg.input)",entity:"@s",nbt:"Tags"}



## Get ID.
scoreboard players set #egg:input/-mainhand|id -- 0
execute store result score #egg:input/-mainhand|id -- run data get entity @s SelectedItem.components."minecraft:custom_data".egg.id
return run scoreboard players get #egg:input/-mainhand|id --
