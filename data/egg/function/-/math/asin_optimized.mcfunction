## Get arcsin value from optimized trigonometric value.
# score <<x~fixed  <<| Trigonometric value x ~fixed
# return           >>| Asin value ~fixed

## Identity for optitmization.
# asin x = pi/2 - asin √(1-x^2)
# x greater than √1/2 can be converted to x less than √1/2.

## x = √(1-x^2)
# x^2
scoreboard players operation #egg:-/math/asin_optimized|x^2~fixed -- = #egg:-/math/asin_optimized|<<x~fixed --
scoreboard players operation #egg:-/math/asin_optimized|x^2~fixed -- *= #egg:-/math/asin_optimized|<<x~fixed --
scoreboard players operation #egg:-/math/asin_optimized|x^2~fixed -- /= #egg|unit~fixed --
# 1-x^2
scoreboard players operation #egg:-/math/sqrt|<<x -- = #egg|1~fixed --
scoreboard players operation #egg:-/math/sqrt|<<x -- -= #egg:-/math/asin_optimized|x^2~fixed --
scoreboard players operation #egg:-/math/sqrt|<<x -- *= #egg|unit~fixed --
# √(1-x^2)
execute store result score #egg:-/math/asin|<<x~fixed -- run function egg:-/math/sqrt

## asin √(1-x^2)
execute store result score #egg:-/math/asin_optimized|asin~fixed -- run function egg:-/math/asin

## asin x = pi/2 - asin √(1-x^2)
# pi/2
scoreboard players operation #egg:-/math/asin_optimized|pi/2-asin~fixed -- = #egg|pi/2~fixed --
# pi/2 - asin √(1-x^2)
return run scoreboard players operation #egg:-/math/asin_optimized|pi/2-asin~fixed -- -= #egg:-/math/asin_optimized|asin~fixed --
