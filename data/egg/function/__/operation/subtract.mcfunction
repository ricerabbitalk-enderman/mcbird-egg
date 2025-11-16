## Subtract values ~fixed
# score <<x~fixed  <<| Fixed value x
# score <<y~fixed  <<| Fixed value y
# return           >>| Fixed result

## Get parameters.
scoreboard players operation #egg:__/operation/add|x~fixed -- = #egg:__/operation/add|<<x~fixed --
scoreboard players operation #egg:__/operation/add|y~fixed -- = #egg:__/operation/add|<<y~fixed --

## Correct.
# x
execute if score #egg:__/operation/add|x~fixed -- > #egg|FIXED_POINT_ADDITION_MAX -- \
  run scoreboard players operation #egg:__/operation/add|x~fixed -- = #egg|FIXED_POINT_ADDITION_MAX --
execute if score #egg:__/operation/add|x~fixed -- < #egg|FIXED_POINT_ADDITION_MIN -- \
  run scoreboard players operation #egg:__/operation/add|x~fixed -- = #egg|FIXED_POINT_ADDITION_MIN --
# y
execute if score #egg:__/operation/add|y~fixed -- > #egg|FIXED_POINT_ADDITION_MAX -- \
  run scoreboard players operation #egg:__/operation/add|y~fixed -- = #egg|FIXED_POINT_ADDITION_MAX --
execute if score #egg:__/operation/add|y~fixed -- < #egg|FIXED_POINT_ADDITION_MIN -- \
  run scoreboard players operation #egg:__/operation/add|y~fixed -- = #egg|FIXED_POINT_ADDITION_MIN --

## Get x-y ~fixed.
# Subtract
scoreboard players operation #egg:__/operation/add|x-y~fixed -- = #egg:__/operation/add|x~fixed --
return run scoreboard players operation #egg:__/operation/add|x-y~fixed -- -= #egg:__/operation/add|y~fixed --
