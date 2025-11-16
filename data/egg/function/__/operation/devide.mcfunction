## Devide values ~fixed
# score <<x~fixed  <<| Fixed numerator
# score <<y~fixed  <<| Fixed denominator
# return           >>| Fixed result

## Parameters.
scoreboard players operation #egg:__/operation/devide|x~fixed -- = #egg:__/operation/devide|<<x~fixed --
scoreboard players operation #egg:__/operation/devide|y~fixed -- = #egg:__/operation/devide|<<y~fixed --

## Get sgn.
# x
scoreboard players operation #egg:__/math/sgn|<<x -- = #egg:__/operation/devide|x~adjusted --
execute store result score #egg:__/operation/devide|sgn_x -- run function egg:__/math/sgn
# y
scoreboard players operation #egg:__/math/sgn|<<x -- = #egg:__/operation/devide|y~adjusted --
execute store result score #egg:__/operation/devide|sgn_y -- run function egg:__/math/sgn
# x/y
scoreboard players operation #egg:__/operation/devide|sgn -- = #egg:__/operation/devide|sgn_x --
scoreboard players operation #egg:__/operation/devide|sgn -- *= #egg:__/operation/devide|sgn_y --

## Uncalculatable.
scoreboard players operation #egg:__/operation/devide|uncalculatable~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:__/operation/devide|uncalculatable~fixed -- *= #egg:__/operation/devide|cast --
execute if score #egg:__/operation/devide|y~fixed -- matches 0 \
  run return run scoreboard players operation #egg:__/operation/devide|uncalculatable~fixed -- *= #egg:__/operation/devide|sgn_x --

## Reciprocal.
scoreboard players operation #egg:__/operation/devide|1/y~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:__/operation/devide|1/y~fixed -- /= #egg:__/operation/devide|y~fixed --
execute if score #egg:__/operation/devide|1/y~fixed -- matches 0 run scoreboard players operation #egg:__/operation/devide|1/y~fixed -- = #egg:__/operation/devide|sgn --

## Multiply.
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:__/operation/devide|x~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:__/operation/devide|1/y~fixed --
return run function egg:__/operation/multiply
