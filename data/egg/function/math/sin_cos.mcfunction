## Get sin and cos.
# storage <<degree~double  <<| Unlimited degrees ~double
# storage >>sin~double     >>| Sin value ~double
# storage >>cos~double     >>| Cos value ~double
# return                   >>| Success

## Cast to fixed.
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:math/sin_cos <<degree~double
execute store result score #egg:math/fixed/sin_cos|<<degree~fixed -- run function egg:-/point/fixed/from_double

## Calculate.
function egg:math/fixed/sin_cos

## Cast to double.
# sin
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/sin_cos >>sin~double set from storage egg:-/point/fixed/to_double >>~double
# cos
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/sin_cos >>cos~double set from storage egg:-/point/fixed/to_double >>~double

## Success.
return 1
