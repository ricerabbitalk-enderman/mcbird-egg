## Get arctan.
# storage <<m~double     <<| Slope m ~double
# storage >>atan~double  >>| Arctan value ~double
# return                 >>| Success

## Cast to fixed.
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/atan <<m~double
execute store result score #egg:math/fixed/atan|<<m~fixed -- run function egg:math/fixed/fixed_from_double

## Calculate.
execute store result score #egg:math/fixed/double_from_fixed|<<~fixed -- run function egg:math/fixed/atan

## Cast to double.
# arctan
function egg:math/fixed/double_from_fixed
data modify storage egg:math/atan >>atan~double set from storage egg:math/fixed/double_from_fixed >>~double

## Success.
return 1
