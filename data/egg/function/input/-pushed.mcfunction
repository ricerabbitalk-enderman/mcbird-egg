## Verify.
execute unless entity @s[type=minecraft:player] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-pushed (2): entity denied (expected type=minecraft:player)",selector:"@s"}
execute unless entity @s[tag=egg.input] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-pushed (3): entity denied (expected tag=egg.input)",entity:"@s",nbt:"Tags"}





## Pushed.
return run scoreboard players get @s egg.input.+0
