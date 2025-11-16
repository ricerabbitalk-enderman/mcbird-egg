## Multiply values ~fixed
# score <<x~fixed  <<| Fixed value x
# score <<y~fixed  <<| Fixed value y
# return           >>| Fixed result

## Get parameters.
scoreboard players operation #egg:__/operation/multiply|x~fixed -- = #egg:__/operation/multiply|<<x~fixed --
scoreboard players operation #egg:__/operation/multiply|y~fixed -- = #egg:__/operation/multiply|<<y~fixed --

## Correct.
# x
execute if score #egg:__/operation/multiply|x~fixed -- > #egg|FIXED_POINT_MULTIPLICATION_MAX -- \
  run scoreboard players operation #egg:__/operation/multiply|x~fixed -- = #egg|FIXED_POINT_MULTIPLICATION_MAX --
execute if score #egg:__/operation/multiply|x~fixed -- < #egg|FIXED_POINT_MULTIPLICATION_MIN -- \
  run scoreboard players operation #egg:__/operation/multiply|x~fixed -- = #egg|FIXED_POINT_MULTIPLICATION_MIN --
# y
execute if score #egg:__/operation/multiply|y~fixed -- > #egg|FIXED_POINT_MULTIPLICATION_MAX -- \
  run scoreboard players operation #egg:__/operation/multiply|y~fixed -- = #egg|FIXED_POINT_MULTIPLICATION_MAX --
execute if score #egg:__/operation/multiply|y~fixed -- < #egg|FIXED_POINT_MULTIPLICATION_MIN -- \
  run scoreboard players operation #egg:__/operation/multiply|y~fixed -- = #egg|FIXED_POINT_MULTIPLICATION_MIN --

## to ~adjusted.
# x
scoreboard players operation #egg:__/point/adjusted/from_fixed|<<~fixed -- = #egg:__/operation/multiply|x~fixed --
execute store result score #egg:__/operation/multiply|x~adjusted -- run function egg:__/point/adjusted/from_fixed
scoreboard players operation #egg:__/operation/multiply|x-unit~adjusted -- = #egg:__/point/adjusted/from_fixed|>>unit~adjusted --
# y
scoreboard players operation #egg:__/point/adjusted/from_fixed|<<~fixed -- = #egg:__/operation/multiply|y~fixed --
execute store result score #egg:__/operation/multiply|y~adjusted -- run function egg:__/point/adjusted/from_fixed
scoreboard players operation #egg:__/operation/multiply|y-unit~adjusted -- = #egg:__/point/adjusted/from_fixed|>>unit~adjusted --

## Cast factor.
# x-unit * y-unit
scoreboard players operation #egg:__/operation/multiply|term -- = #egg:__/operation/multiply|x-unit~adjusted --
scoreboard players operation #egg:__/operation/multiply|term -- *= #egg:__/operation/multiply|y-unit~adjusted --
# factor
scoreboard players operation #egg:__/operation/multiply|cast -- = #egg|double~fixed --
scoreboard players operation #egg:__/operation/multiply|cast -- /= #egg:__/operation/multiply|term --

## Multiply.
scoreboard players operation #egg:__/operation/multiply|x*y~fixed -- = #egg:__/operation/multiply|x~adjusted --
scoreboard players operation #egg:__/operation/multiply|x*y~fixed -- *= #egg:__/operation/multiply|y~adjusted --
scoreboard players operation #egg:__/operation/multiply|x*y~fixed -- /= #egg|unit~fixed --
return run scoreboard players operation #egg:__/operation/multiply|x*y~fixed -- *= #egg:__/operation/multiply|cast --
