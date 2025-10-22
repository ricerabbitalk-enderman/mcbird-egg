## Get square root value.
# score <<x  <<| x
# return     <<| √x

## Extraction of square root.
# Regarding the precise calculation method,
# since the number of digits is halved,
# when using fixed-point arithmetic, 
# be sure to multiply by the unit before execution.

## Set Value.
# x
scoreboard players operation #egg:math/-/loop_to_sqrt|x -- = #egg:math/sqrt|<<x --

## x = 0
execute if score #egg:math/-/loop_to_sqrt|x -- matches 0 run return 0

## Get base (The basis for extracting the calculation target 2^n).
scoreboard players operation #egg:math/-/loop_to_base|x -- = #egg:math/sqrt|<<x --
scoreboard players set #egg:math/-/loop_to_base|base -- 1
execute store result score #egg:math/-/loop_to_sqrt|base -- run function egg:math/-/loop_to_base

## Get first terms.
# right-a
scoreboard players operation #egg:math/-/loop_to_sqrt|right-a -- = #egg:math/sqrt|<<x --
scoreboard players operation #egg:math/-/loop_to_sqrt|right-a -- /= #egg:math/-/loop_to_sqrt|base --
scoreboard players operation #egg:math/-/loop_to_sqrt|right-a -- %= #egg|2^2 --
# Move base (Bit shift right [2bit 2^2]).
scoreboard players operation #egg:math/-/loop_to_sqrt|base -- /= #egg|2^2 --
# right-b
scoreboard players set #egg:math/-/loop_to_sqrt|right-b -- 1
# left-a
scoreboard players set #egg:math/-/loop_to_sqrt|left-a -- 1
# left-b
scoreboard players set #egg:math/-/loop_to_sqrt|left-b -- 1
# result
scoreboard players set #egg:math/-/loop_to_sqrt|result -- 1

## Calculate.
return run function egg:math/-/loop_to_sqrt
