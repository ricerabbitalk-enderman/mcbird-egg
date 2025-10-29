## Get whether it is the first pressed tick.
# return  >>| Ticks that have not been pressed yet.

## Verify.
execute unless entity @s[type=minecraft:player,tag=egg.input] run return run function #egg:error {message:"@s is not egg.input."}

## Pressed.
execute if score @s egg.input.-1 matches ..0 if score @s egg.input.+0 matches 0.. \
  run return run scoreboard players operation @s egg.input.-1 *= #egg|-1 --

return 0
