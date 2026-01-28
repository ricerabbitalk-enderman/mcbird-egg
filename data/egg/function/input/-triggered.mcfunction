## Verify.
execute unless entity @s[type=minecraft:player] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-triggered (2): entity denied (expected type=minecraft:player)",selector:"@s"}
execute unless entity @s[tag=egg.input] run return run function egg:__/error/throw {message:"[ERROR] function egg:input/-triggered (3): entity denied (expected tag=egg.input)",entity:"@s",nbt:"Tags"}



## Triggered.
execute if score @s egg.input.-1 matches ..0 if score @s egg.input.+0 matches 0.. \
  run return run scoreboard players operation @s egg.input.-1 *= #egg|-1 --
## not Triggered.
return 0
