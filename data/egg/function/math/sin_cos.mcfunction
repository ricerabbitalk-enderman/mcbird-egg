## Get sin and cos.
# storage <<degree~double  <<| Unlimited degrees ~double
# storage >>sin~double     >>| Sin value ~double
# storage >>cos~double     >>| Cos value ~double
# return                   >>| Success

## Cast to fixed.
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/sin_cos <<degree~double
execute store result score #egg:math/fixed/sin_cos|<<degree~fixed -- run function egg:math/fixed/fixed_from_double

## Calculate.
function egg:math/fixed/sin_cos

## Cast to double.
# sin
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:math/sin_cos >>sin~double set from storage egg:math/fixed/double_from_fixed >>~double
# cos
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:math/sin_cos >>cos~double set from storage egg:math/fixed/double_from_fixed >>~double

## Success.
return 1
