## Get arctan value from optimized slope value.
# score <<m~fixed  <<| slope value m ~fixed
# return           >>| Atan value ~fixed

## Identity for optitmization.
# atan m = pi/2 - atan 1/m
# m greater than 1 can be converted to x less than 1.

## 1/m
scoreboard players operation #egg:__/math/atan_calculate|<<m~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:__/math/atan_calculate|<<m~fixed -- /= #egg:__/math/atan_optimized|<<m~fixed --

## atan 1/m
execute store result score #egg:__/math/atan_optimized|atan~fixed -- run function egg:__/math/atan_calculate

## atan m = pi/2 - atan 1/m
# pi/2
scoreboard players operation #egg:__/math/atan_optimized|pi/2-atan~fixed -- = #egg|pi/2~fixed --
# pi/2 - atan 1/m
scoreboard players operation #egg:__/math/atan_optimized|pi/2-atan~fixed -- -= #egg:__/math/atan_optimized|atan~fixed --

return run scoreboard players get #egg:__/math/atan_optimized|pi/2-atan~fixed --