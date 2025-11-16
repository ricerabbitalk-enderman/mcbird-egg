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
scoreboard players operation #egg:__/operation/devide|<<x~fixed -- = #egg:math/fixed/sin_cos_tan|>>sin~fixed --
scoreboard players operation #egg:__/operation/devide|<<y~fixed -- = #egg:math/fixed/sin_cos_tan|>>cos~fixed --
execute store result score #egg:math/fixed/sin_cos_tan|>>tan~fixed -- run function egg:__/operation/devide

## Success.
return 1
