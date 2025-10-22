## Get arctan value supporting the quadrant.
# score <<x~fixed    <<| Coordinate x ~fixed
# score <<y~fixed    <<| Coordinate y ~fixed
# return             >>| Arctan value ~fixed

scoreboard players operation #egg:math/fixed/atan2|x~fixed -- = #egg:math/fixed/atan2|<<x~fixed --
scoreboard players operation #egg:math/fixed/atan2|y~fixed -- = #egg:math/fixed/atan2|<<y~fixed --

## Limit.
execute if score #egg:math/fixed/atan2|x~fixed -- > #egg|1~fixed -- run scoreboard players operation #egg:math/fixed/atan2|x~fixed -- = #egg|1~fixed --
execute if score #egg:math/fixed/atan2|x~fixed -- < #egg|-1~fixed -- run scoreboard players operation #egg:math/fixed/atan2|x~fixed -- = #egg|-1~fixed --
execute if score #egg:math/fixed/atan2|y~fixed -- > #egg|1~fixed -- run scoreboard players operation #egg:math/fixed/atan2|y~fixed -- = #egg|1~fixed --
execute if score #egg:math/fixed/atan2|y~fixed -- < #egg|-1~fixed -- run scoreboard players operation #egg:math/fixed/atan2|y~fixed -- = #egg|-1~fixed --

## Uncalculatable.
execute if score #egg:math/fixed/atan2|x~fixed -- matches 0 if score #egg:math/fixed/atan2|y~fixed -- matches 0 run return 0

## Special case.
execute if score #egg:math/fixed/atan2|x~fixed -- matches 0 if score #egg:math/fixed/atan2|y~fixed -- matches 1.. run return run scoreboard players get #egg|pi*1/2~fixed --
execute if score #egg:math/fixed/atan2|x~fixed -- matches 0 if score #egg:math/fixed/atan2|y~fixed -- matches ..-1 run return run scoreboard players get #egg|pi*-1/2~fixed --
execute if score #egg:math/fixed/atan2|y~fixed -- matches 0 if score #egg:math/fixed/atan2|x~fixed -- matches ..-1 run return run scoreboard players get #egg|pi~fixed --
execute if score #egg:math/fixed/atan2|y~fixed -- matches 0 if score #egg:math/fixed/atan2|x~fixed -- matches 1.. run return 0

## Get quadrant.
execute if score #egg:math/fixed/atan2|x~fixed -- matches 1.. if score #egg:math/fixed/atan2|y~fixed -- matches 1.. run scoreboard players set #egg:math/fixed/atan2|quadrant -- 1
execute if score #egg:math/fixed/atan2|x~fixed -- matches ..-1 if score #egg:math/fixed/atan2|y~fixed -- matches 1.. run scoreboard players set #egg:math/fixed/atan2|quadrant -- 2
execute if score #egg:math/fixed/atan2|x~fixed -- matches ..-1 if score #egg:math/fixed/atan2|y~fixed -- matches ..-1 run scoreboard players set #egg:math/fixed/atan2|quadrant -- 3
execute if score #egg:math/fixed/atan2|x~fixed -- matches 1.. if score #egg:math/fixed/atan2|y~fixed -- matches ..-1 run scoreboard players set #egg:math/fixed/atan2|quadrant -- 4

# unit ~adjusted
scoreboard players operation #egg:math/fixed/-/atan_unit|<<x~fixed -- = #egg:math/fixed/atan2|x~fixed --
scoreboard players operation #egg:math/fixed/-/atan_unit|<<y~fixed -- = #egg:math/fixed/atan2|y~fixed --
execute store result score #egg:math/fixed/atan2|>>unit~adjusted -- run function egg:math/fixed/-/atan_unit
# bit shift
scoreboard players operation #egg:math/fixed/atan2|shift -- = #egg|unit~fixed --
scoreboard players operation #egg:math/fixed/atan2|shift -- /= #egg:math/fixed/atan2|>>unit~adjusted --
# x ~adjusted and y ~adjusted
scoreboard players operation #egg:math/fixed/atan2|x~adjusted -- = #egg:math/fixed/atan2|x~fixed --
scoreboard players operation #egg:math/fixed/atan2|x~adjusted -- /= #egg:math/fixed/atan2|shift --
scoreboard players operation #egg:math/fixed/atan2|y~adjusted -- = #egg:math/fixed/atan2|y~fixed --
scoreboard players operation #egg:math/fixed/atan2|y~adjusted -- /= #egg:math/fixed/atan2|shift --

## Calculate slope m = y/x.
# 1/x
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/atan2|>>unit~adjusted --
scoreboard players operation #egg:math/abs|<<x -- *= #egg:math/fixed/atan2|>>unit~adjusted --
scoreboard players operation #egg:math/abs|<<x -- /= #egg:math/fixed/atan2|x~adjusted --
# y/x = 1/x * y
scoreboard players operation #egg:math/abs|<<x -- *= #egg:math/fixed/atan2|y~adjusted --
scoreboard players operation #egg:math/abs|<<x -- /= #egg:math/fixed/atan2|>>unit~adjusted --
execute store result score #egg:math/fixed/atan2|m~adjusted -- run function egg:math/abs

# m ~fixed
scoreboard players operation #egg:math/fixed/atan|<<m~fixed -- = #egg:math/fixed/atan2|m~adjusted --
scoreboard players operation #egg:math/fixed/atan|<<m~fixed -- *= #egg|unit~fixed --
scoreboard players operation #egg:math/fixed/atan|<<m~fixed -- /= #egg:math/fixed/atan2|>>unit~adjusted --

## atan
execute store result score #egg:math/fixed/atan2|atan~fixed -- run function egg:math/fixed/atan

## Correct by quadrant.
# Inverse.
execute if score #egg:math/fixed/atan2|quadrant -- matches 2 run scoreboard players operation #egg:math/fixed/atan2|atan~fixed -- *= #egg|-1 --
execute if score #egg:math/fixed/atan2|quadrant -- matches 4 run scoreboard players operation #egg:math/fixed/atan2|atan~fixed -- *= #egg|-1 --
# Add or subtract pi.
execute if score #egg:math/fixed/atan2|quadrant -- matches 2 run scoreboard players operation #egg:math/fixed/atan2|atan~fixed -- += #egg|pi~fixed --
execute if score #egg:math/fixed/atan2|quadrant -- matches 3 run scoreboard players operation #egg:math/fixed/atan2|atan~fixed -- -= #egg|pi~fixed --

## Return.
return run scoreboard players get #egg:math/fixed/atan2|atan~fixed --
