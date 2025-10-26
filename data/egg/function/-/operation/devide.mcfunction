## Devide values ~fixed
# score <<x~fixed  <<| Fixed numerator
# score <<y~fixed  <<| Fixed denominator
# return           >>| Fixed result

## Parameters.
scoreboard players operation #egg:-/operation/devide|x~fixed -- = #egg:-/operation/devide|<<x~fixed --
scoreboard players operation #egg:-/operation/devide|y~fixed -- = #egg:-/operation/devide|<<y~fixed --

## Get sgn.
# x
scoreboard players operation #egg:-/math/sgn|<<x -- = #egg:-/operation/devide|x~adjusted --
execute store result score #egg:-/operation/devide|sgn_x -- run function egg:-/math/sgn
# y
scoreboard players operation #egg:-/math/sgn|<<x -- = #egg:-/operation/devide|y~adjusted --
execute store result score #egg:-/operation/devide|sgn_y -- run function egg:-/math/sgn
# x/y
scoreboard players operation #egg:-/operation/devide|sgn -- = #egg:-/operation/devide|sgn_x --
scoreboard players operation #egg:-/operation/devide|sgn -- *= #egg:-/operation/devide|sgn_y --

## Uncalculatable.
scoreboard players operation #egg:-/operation/devide|uncalculatable~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/operation/devide|uncalculatable~fixed -- *= #egg:-/operation/devide|cast --
execute if score #egg:-/operation/devide|y~fixed -- matches 0 \
  run return run scoreboard players operation #egg:-/operation/devide|uncalculatable~fixed -- *= #egg:-/operation/devide|sgn_x --

## Reciprocal.
scoreboard players operation #egg:-/operation/devide|1/y~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/operation/devide|1/y~fixed -- /= #egg:-/operation/devide|y~fixed --
execute if score #egg:-/operation/devide|1/y~fixed -- matches 0 run scoreboard players operation #egg:-/operation/devide|1/y~fixed -- = #egg:-/operation/devide|sgn --

## Multiply.
scoreboard players operation #egg:-/operation/multiply|<<x~fixed -- = #egg:-/operation/devide|x~fixed --
scoreboard players operation #egg:-/operation/multiply|<<y~fixed -- = #egg:-/operation/devide|1/y~fixed --
return run function egg:-/operation/multiply
