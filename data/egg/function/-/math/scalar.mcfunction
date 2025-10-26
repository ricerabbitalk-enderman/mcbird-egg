## Get scalar from vector
# score <<x~fixed  <<| Vector x value ~fixed
# score <<y~fixed  <<| Vector y value ~fixed
# score <<z~fixed  <<| Vector z value ~fixed
# return           <<| Scalar ~fixed

## Parameters.
scoreboard players operation #egg:-/math/scalar|x~fixed -- = #egg:-/math/scalar|<<x~fixed --
scoreboard players operation #egg:-/math/scalar|y~fixed -- = #egg:-/math/scalar|<<y~fixed --
scoreboard players operation #egg:-/math/scalar|z~fixed -- = #egg:-/math/scalar|<<z~fixed --

## Value^2.
# x^2
scoreboard players operation #egg:-/operation/multiply|<<x~fixed -- = #egg:-/math/scalar|x~fixed --
scoreboard players operation #egg:-/operation/multiply|<<y~fixed -- = #egg:-/math/scalar|x~fixed --
execute store result score #egg:-/math/scalar|x^2~fixed -- run function egg:-/operation/multiply
# y^2
scoreboard players operation #egg:-/operation/multiply|<<x~fixed -- = #egg:-/math/scalar|y~fixed --
scoreboard players operation #egg:-/operation/multiply|<<y~fixed -- = #egg:-/math/scalar|y~fixed --
execute store result score #egg:-/math/scalar|y^2~fixed -- run function egg:-/operation/multiply
# z^2
scoreboard players operation #egg:-/operation/multiply|<<x~fixed -- = #egg:-/math/scalar|z~fixed --
scoreboard players operation #egg:-/operation/multiply|<<y~fixed -- = #egg:-/math/scalar|z~fixed --
execute store result score #egg:-/math/scalar|z^2~fixed -- run function egg:-/operation/multiply

## x^2+y^2+z^2
# x^2+y^2
scoreboard players operation #egg:-/operation/add|<<x~fixed -- = #egg:-/math/scalar|x^2~fixed --
scoreboard players operation #egg:-/operation/add|<<y~fixed -- = #egg:-/math/scalar|y^2~fixed --
execute store result score #egg:-/math/scalar|term~fixed -- run function egg:-/operation/add
# x^2+y^2+z^2
scoreboard players operation #egg:-/operation/add|<<x~fixed -- = #egg:-/math/scalar|term~fixed --
scoreboard players operation #egg:-/operation/add|<<y~fixed -- = #egg:-/math/scalar|z^2~fixed --
execute store result score #egg:-/math/scalar|term~fixed -- run function egg:-/operation/add
# to ~adjusted
scoreboard players operation #egg:-/point/adjusted/from_fixed|<<~fixed -- = #egg:-/math/scalar|term~fixed --
execute store result score #egg:-/math/scalar|term~adjusted -- run function egg:-/point/adjusted/from_fixed
scoreboard players operation #egg:-/math/scalar|unit~adjusted -- = #egg:-/point/adjusted/from_fixed|>>unit~adjusted --

## √(x^2+y^2+z^2)
# √(x^2+y^2+z^2) ~adjusted
scoreboard players operation #egg:-/math/sqrt|<<x -- = #egg:-/math/scalar|term~adjusted --
scoreboard players operation #egg:-/math/sqrt|<<x -- *= #egg:-/math/scalar|unit~adjusted --
execute store result score #egg:-/point/adjusted/to_fixed|<<~adjusted -- run function egg:-/math/sqrt
scoreboard players operation #egg:-/point/adjusted/to_fixed|<<unit~adjusted -- = #egg:-/math/scalar|unit~adjusted --
# √(x^2+y^2+z^2) ~fixed
return run function egg:-/point/adjusted/to_fixed
