## Get scalar from vector
# score <<x~fixed  <<| Vector x value ~fixed
# score <<y~fixed  <<| Vector y value ~fixed
# score <<z~fixed  <<| Vector z value ~fixed
# return           <<| Scalar ~fixed

## Parameters.
scoreboard players operation #egg:__/math/scalar|x~fixed -- = #egg:__/math/scalar|<<x~fixed --
scoreboard players operation #egg:__/math/scalar|y~fixed -- = #egg:__/math/scalar|<<y~fixed --
scoreboard players operation #egg:__/math/scalar|z~fixed -- = #egg:__/math/scalar|<<z~fixed --

## Value^2.
# x^2
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:__/math/scalar|x~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:__/math/scalar|x~fixed --
execute store result score #egg:__/math/scalar|x^2~fixed -- run function egg:__/operation/multiply
# y^2
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:__/math/scalar|y~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:__/math/scalar|y~fixed --
execute store result score #egg:__/math/scalar|y^2~fixed -- run function egg:__/operation/multiply
# z^2
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:__/math/scalar|z~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:__/math/scalar|z~fixed --
execute store result score #egg:__/math/scalar|z^2~fixed -- run function egg:__/operation/multiply

## x^2+y^2+z^2
# x^2+y^2
scoreboard players operation #egg:__/operation/add|<<x~fixed -- = #egg:__/math/scalar|x^2~fixed --
scoreboard players operation #egg:__/operation/add|<<y~fixed -- = #egg:__/math/scalar|y^2~fixed --
execute store result score #egg:__/math/scalar|term~fixed -- run function egg:__/operation/add
# x^2+y^2+z^2
scoreboard players operation #egg:__/operation/add|<<x~fixed -- = #egg:__/math/scalar|term~fixed --
scoreboard players operation #egg:__/operation/add|<<y~fixed -- = #egg:__/math/scalar|z^2~fixed --
execute store result score #egg:__/math/scalar|term~fixed -- run function egg:__/operation/add
# to ~adjusted
scoreboard players operation #egg:__/point/adjusted/from_fixed|<<~fixed -- = #egg:__/math/scalar|term~fixed --
execute store result score #egg:__/math/scalar|term~adjusted -- run function egg:__/point/adjusted/from_fixed
scoreboard players operation #egg:__/math/scalar|unit~adjusted -- = #egg:__/point/adjusted/from_fixed|>>unit~adjusted --

## √(x^2+y^2+z^2)
# √(x^2+y^2+z^2) ~adjusted
scoreboard players operation #egg:__/math/sqrt|<<x -- = #egg:__/math/scalar|term~adjusted --
scoreboard players operation #egg:__/math/sqrt|<<x -- *= #egg:__/math/scalar|unit~adjusted --
execute store result score #egg:__/point/adjusted/to_fixed|<<~adjusted -- run function egg:__/math/sqrt
scoreboard players operation #egg:__/point/adjusted/to_fixed|<<unit~adjusted -- = #egg:__/math/scalar|unit~adjusted --
# √(x^2+y^2+z^2) ~fixed
return run function egg:__/point/adjusted/to_fixed

## √(x^2+y^2+z^2)
# √(x^2+y^2+z^2) ~adjusted
scoreboard players operation #egg:__/math/sqrt2|<<x -- = #egg:__/math/scalar|term~adjusted --
scoreboard players operation #egg:__/math/sqrt2|<<unit -- = #egg:__/math/scalar|unit~adjusted --
execute store result score #egg:__/point/adjusted/to_fixed|<<~adjusted -- run function egg:__/math/sqrt2
scoreboard players operation #egg:__/point/adjusted/to_fixed|<<unit~adjusted -- = #egg:__/math/scalar|unit~adjusted --
# √(x^2+y^2+z^2) ~fixed
return run function egg:__/point/adjusted/to_fixed
