## Get arctan.
# storage <<x~double     <<| Coordinate x ~double
# storage <<y~double     <<| Coordinate y ~double
# storage >>atan~double  >>| Arctan value ~double
# return                 >>| Success

## Cast to fixed.
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:math/atan2 <<x~double
execute store result score #egg:math/fixed/atan2|<<x~fixed -- run function egg:-/point/fixed/from_double
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:math/atan2 <<y~double
execute store result score #egg:math/fixed/atan2|<<y~fixed -- run function egg:-/point/fixed/from_double

## Calculate.
execute store result score #egg:-/point/fixed/to_double|<<~fixed -- run function egg:math/fixed/atan2

## Cast to double.
# arctan
function egg:-/point/fixed/to_double
data modify storage egg:math/atan2 >>atan~double set from storage egg:-/point/fixed/to_double >>~double

## Success.
return 1
