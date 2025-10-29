## Get whether the key has been released.
# return  >>| Ticks that have been continuously pressed.

## Verify.
execute unless entity @s[type=minecraft:player,tag=egg.input] run return run function #egg:error {message:"@s is not egg.input."}

## Released.
execute if score @s egg.input.-1 matches 0.. if score @s egg.input.+0 matches ..0 run return run scoreboard players get @s egg.input.-1
return 0
