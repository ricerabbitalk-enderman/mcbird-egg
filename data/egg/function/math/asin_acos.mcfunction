## Get arcsin and arccos.
# storage <<x~double     <<| Trigonometric value x ~double
# storage >>asin~double  >>| Arcsin value ~double
# storage >>acos~double  >>| Arccos value ~double
# return                 >>| Success

## Cast to fixed.
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:math/asin_acos <<x~double
execute store result score #egg:math/fixed/asin_acos|<<x~fixed -- run function egg:-/point/fixed/from_double

## Calculate.
function egg:math/fixed/asin_acos

## Cast to double.
# arcsin
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/asin_acos|>>asin~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/asin_acos >>asin~double set from storage egg:-/point/fixed/to_double >>~double
# arccos
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/asin_acos|>>acos~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:math/asin_acos >>acos~double set from storage egg:-/point/fixed/to_double >>~double

## Success.
return 1
