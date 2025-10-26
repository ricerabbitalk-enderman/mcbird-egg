## Get absolute value.
# score <<x  <<| x
# return     >>| |x|

## Raw value.
execute if score #egg:-/math/abs|<<x -- matches 0.. run return run scoreboard players get #egg:-/math/abs|<<x --

## Inverse.
scoreboard players operation #egg:-/math/abs|x -- = #egg:-/math/abs|<<x --
scoreboard players operation #egg:-/math/abs|x -- *= #egg|-1 --
## Return.
return run scoreboard players get #egg:-/math/abs|x --
