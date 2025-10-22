## Get arcsin and arccos.
# storage <<x~double     <<| Trigonometric value x ~double
# storage >>asin~double  >>| Arcsin value ~double
# storage >>acos~double  >>| Arccos value ~double
# return                 >>| Success

## Cast to fixed.
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/asin_acos <<x~double
execute store result score #egg:math/fixed/asin_acos|<<x~fixed -- run function egg:math/fixed/fixed_from_double

## Correct x.
scoreboard players operation #egg:math/fixed/asin_acos|<<x~fixed -- < #egg|1~fixed --
scoreboard players operation #egg:math/fixed/asin_acos|<<x~fixed -- > #egg|-1~fixed --

## Calculate.
function egg:math/fixed/asin_acos

## Cast to double.
# arcsin
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/asin_acos|>>asin~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:math/asin_acos >>asin~double set from storage egg:math/fixed/double_from_fixed >>~double
# arccos
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/asin_acos|>>acos~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:math/asin_acos >>acos~double set from storage egg:math/fixed/double_from_fixed >>~double

## Success.
return 1
