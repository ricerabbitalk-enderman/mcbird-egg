## Get whether it is currently pressed.
# return  >>| Ticks while continuously pressed.

## Verify.
execute unless entity @s[type=minecraft:player,tag=egg.input] run return run function #egg:error {message:"@s is not egg.input."}

## Pushed.
return run scoreboard players get @s egg.input.+0
