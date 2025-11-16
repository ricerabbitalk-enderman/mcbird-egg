## Get absolute value.
# score <<x  <<| x
# return     >>| |x|

## Raw value.
execute if score #egg:__/math/abs|<<x -- matches 0.. run return run scoreboard players get #egg:__/math/abs|<<x --

## Inverse.
scoreboard players operation #egg:__/math/abs|x -- = #egg:__/math/abs|<<x --
scoreboard players operation #egg:__/math/abs|x -- *= #egg|-1 --
## Return.
return run scoreboard players get #egg:__/math/abs|x --
