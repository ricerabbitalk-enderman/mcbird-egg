## Get trigonometric values (sin, cos, tan). 
# score <<degree~fixed   <<| Unlimited degree ~fixed
# score >>sin~fixed      >>| Sin value ~fixed
# score >>cos~fixed      >>| Cos value ~fixed
# score >>tan~halfixed   >>| Tan value ~halfixed
# return                 <<| Success

## Get sin and cos.
scoreboard players operation #egg:math/fixed/sin_cos|<<degree~fixed -- = #egg:math/fixed/sin_cos_tan|<<degree~fixed --
function egg:math/fixed/sin_cos
# sin ~fixed and cos ~fixed
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>sin~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>cos~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --
## Calculate tan.
# sgn sin
scoreboard players operation #egg:math/sgn|<<x -- = #egg:math/fixed/sin_cos|>>sin~fixed --
execute store result score #egg:math/fixed/sin_cos_tan|sgn_sin -- run function egg:math/sgn
# sgn cos
scoreboard players operation #egg:math/sgn|<<x -- = #egg:math/fixed/sin_cos|>>cos~fixed --
execute store result score #egg:math/fixed/sin_cos_tan|sgn_cos -- run function egg:math/sgn
# sgn tan
scoreboard players set #egg:math/fixed/sin_cos_tan|sgn_tan -- 1
execute unless score #egg:math/fixed/sin_cos_tan|sgn_sin -- matches 0 \
  run scoreboard players operation #egg:math/fixed/sin_cos_tan|sgn_tan -- *= #egg:math/fixed/sin_cos_tan|sgn_sin --
execute unless score #egg:math/fixed/sin_cos_tan|sgn_cos -- matches 0 \
  run scoreboard players operation #egg:math/fixed/sin_cos_tan|sgn_tan -- *= #egg:math/fixed/sin_cos_tan|sgn_cos --
# Unculculatable tan (When cos is 0 or close to it)
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- = #egg|FIXED_POINT_CULCLATABLE_MAX --
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- *= #egg:math/fixed/sin_cos_tan|sgn_tan --
# unit ~adjusted
scoreboard players operation #egg:math/fixed/-/tan_unit|<<sin~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
scoreboard players operation #egg:math/fixed/-/tan_unit|<<cos~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --
execute store result score #egg:math/fixed/sin_cos_tan|>>unit~adjusted -- run function egg:math/fixed/-/tan_unit
# If cos contains 0 or is an very small value, it is considered uncalculable and returns #egg|FIXED_POINT_CULCLATABLE_MAX as a substitute for infinity.
execute if score #egg:math/fixed/sin_cos_tan|>>unit~adjusted -- matches 1 run return 1
# sin ~adjusted and cos ~adjusted
scoreboard players operation #egg:math/fixed/sin_cos_tan|sin~adjusted -- = #egg:math/fixed/sin_cos|>>sin~fixed --
scoreboard players operation #egg:math/fixed/sin_cos_tan|sin~adjusted -- *= #egg:math/fixed/sin_cos_tan|>>unit~adjusted --
scoreboard players operation #egg:math/fixed/sin_cos_tan|sin~adjusted -- /= #egg|unit~fixed --
scoreboard players operation #egg:math/fixed/sin_cos_tan|cos~adjusted -- = #egg:math/fixed/sin_cos|>>cos~fixed --
scoreboard players operation #egg:math/fixed/sin_cos_tan|cos~adjusted -- *= #egg:math/fixed/sin_cos_tan|>>unit~adjusted --
scoreboard players operation #egg:math/fixed/sin_cos_tan|cos~adjusted -- /= #egg|unit~fixed --
# tan ~adjusted
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- = #egg:math/fixed/sin_cos_tan|>>unit~adjusted --
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- *= #egg:math/fixed/sin_cos_tan|>>unit~adjusted --
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- /= #egg:math/fixed/sin_cos_tan|cos~adjusted --
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- *= #egg:math/fixed/sin_cos_tan|sin~adjusted --
scoreboard players operation #egg:math/fixed/sin_cos_tan|>>tan~adjusted -- /= #egg:math/fixed/sin_cos_tan|>>unit~adjusted --

## Success.
return 1
