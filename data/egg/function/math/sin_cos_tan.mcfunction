## Get sin and cos.
# storage <<degree~double  <<| Unlimited degrees ~double
# storage >>sin~double     >>| Sin value ~double
# storage >>cos~double     >>| Cos value ~double
# storage >>tan~double     >>| Tan value ~double
# return                   >>| Success

## Cast to fixed.
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:math/sin_cos_tan <<degree~double
execute store result score #egg:math/fixed/sin_cos_tan|<<degree~fixed -- run function egg:-/point/fixed/from_double

## Calculate.
function egg:math/fixed/sin_cos_tan

## Cast to double.
# sin
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>sin~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/sin_cos_tan >>sin~double set from storage egg:-/point/fixed/to_double >>~double
# cos
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>cos~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/sin_cos_tan >>cos~double set from storage egg:-/point/fixed/to_double >>~double
# tan
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>tan~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/sin_cos_tan >>tan~double set from storage egg:-/point/fixed/to_double >>~double

## Success.
return 1
