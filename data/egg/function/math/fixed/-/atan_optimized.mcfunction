## Get arctan value from optimized slope value.
# score <<m~fixed  <<| slope value m ~fixed
# return           >>| Atan value ~fixed

## Identity for optitmization.
# atan m = pi/2 - atan 1/m
# m greater than 1 can be converted to x less than 1.

## 1/m
scoreboard players operation #egg:math/-/cycl/atan|<<m~fixed -- = #egg|unit^2~fixed --
scoreboard players operation #egg:math/-/cycl/atan|<<m~fixed -- /= #egg:math/fixed/-/atan_optimized|<<m~fixed --

## atan 1/m
execute store result score #egg:math/fixed/-/atan_optimized|atan~fixed -- run function egg:math/-/cycl/atan

## atan m = pi/2 - atan 1/m
# pi/2
scoreboard players operation #egg:math/fixed/-/atan_optimized|pi/2-atan~fixed -- = #egg|pi*1/2~fixed --
# pi/2 - atan 1/m
return run scoreboard players operation #egg:math/fixed/-/atan_optimized|pi/2-atan~fixed -- -= #egg:math/fixed/-/atan_optimized|atan~fixed --
