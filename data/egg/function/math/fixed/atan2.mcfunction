## Get arctan value supporting the quadrant.
# score <<x~fixed    <<| Coordinate x ~fixed
# score <<y~fixed    <<| Coordinate y ~fixed
# return             >>| Arctan value ~fixed

## Parameters.
scoreboard players operation #egg:math/fixed/atan2|x~fixed -- = #egg:math/fixed/atan2|<<x~fixed --
scoreboard players operation #egg:math/fixed/atan2|y~fixed -- = #egg:math/fixed/atan2|<<y~fixed --

## Uncalculatable.
execute if score #egg:math/fixed/atan2|x~fixed -- matches 0 if score #egg:math/fixed/atan2|y~fixed -- matches 0 run return 0

## Special case.
execute if score #egg:math/fixed/atan2|y~fixed -- matches 0 if score #egg:math/fixed/atan2|x~fixed -- matches 1.. run return 0
execute if score #egg:math/fixed/atan2|y~fixed -- matches 0 if score #egg:math/fixed/atan2|x~fixed -- matches ..-1 run return run scoreboard players get #egg|180~fixed --
execute if score #egg:math/fixed/atan2|x~fixed -- matches 0 if score #egg:math/fixed/atan2|y~fixed -- matches 1.. run return run scoreboard players get #egg|90~fixed --
execute if score #egg:math/fixed/atan2|x~fixed -- matches 0 if score #egg:math/fixed/atan2|y~fixed -- matches ..-1 run return run scoreboard players get #egg|-90~fixed --

## Get quadrant.
scoreboard players set #egg:math/fixed/atan2|quadrant -- 0
execute if score #egg:math/fixed/atan2|x~fixed -- matches 1.. if score #egg:math/fixed/atan2|y~fixed -- matches 1.. run scoreboard players set #egg:math/fixed/atan2|quadrant -- 1
execute if score #egg:math/fixed/atan2|x~fixed -- matches ..-1 if score #egg:math/fixed/atan2|y~fixed -- matches 1.. run scoreboard players set #egg:math/fixed/atan2|quadrant -- 2
execute if score #egg:math/fixed/atan2|x~fixed -- matches ..-1 if score #egg:math/fixed/atan2|y~fixed -- matches ..-1 run scoreboard players set #egg:math/fixed/atan2|quadrant -- 3
execute if score #egg:math/fixed/atan2|x~fixed -- matches 1.. if score #egg:math/fixed/atan2|y~fixed -- matches ..-1 run scoreboard players set #egg:math/fixed/atan2|quadrant -- 4

## Get Slope m.
scoreboard players operation #egg:-/operation/devide|<<x~fixed -- = #egg:math/fixed/atan2|y~fixed --
scoreboard players operation #egg:-/operation/devide|<<y~fixed -- = #egg:math/fixed/atan2|x~fixed --
execute store result score #egg:math/fixed/atan|<<m~fixed -- run function egg:-/operation/devide
## atan
execute store result score #egg:math/fixed/atan2|atan~fixed -- run function egg:math/fixed/atan

## Correct by quadrant.
# Add or subtract pi(180°).
execute if score #egg:math/fixed/atan2|quadrant -- matches 2 run scoreboard players operation #egg:math/fixed/atan2|atan~fixed -- += #egg|180~fixed --
execute if score #egg:math/fixed/atan2|quadrant -- matches 3 run scoreboard players operation #egg:math/fixed/atan2|atan~fixed -- -= #egg|180~fixed --

## Return.
return run scoreboard players get #egg:math/fixed/atan2|atan~fixed --
