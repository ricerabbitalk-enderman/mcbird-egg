## Verify.
execute unless entity @s[type=minecraft:player] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-offhand (2): entity denied (expected type=minecraft:player)",selector:"@s"}
execute unless entity @s[tag=egg.input] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-offhand (3): entity denied (expected tag=egg.input)",entity:"@s",nbt:"Tags"}



## Get ID.
scoreboard players set #egg:input/-offhand|id -- 0
execute store result score #egg:input/-offhand|id -- run data get entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".egg.id
return run scoreboard players get #egg:input/-offhand|id --
