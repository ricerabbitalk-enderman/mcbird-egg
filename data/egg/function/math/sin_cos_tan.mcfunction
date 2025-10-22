## Get sin and cos.
# storage <<degree~double  <<| Unlimited degrees ~double
# storage >>sin~double     >>| Sin value ~double
# storage >>cos~double     >>| Cos value ~double
# storage >>tan~double     >>| Tan value ~double
# return                   >>| Success

## Cast to fixed.
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/sin_cos_tan <<degree~double
execute store result score #egg:math/fixed/sin_cos_tan|<<degree~fixed -- run function egg:math/fixed/fixed_from_double

## Calculate.
function egg:math/fixed/sin_cos_tan

## Cast to double.
# sin
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>sin~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:math/sin_cos_tan >>sin~double set from storage egg:math/fixed/double_from_fixed >>~double
# cos
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>cos~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:math/sin_cos_tan >>cos~double set from storage egg:math/fixed/double_from_fixed >>~double
# tan
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>tan~adjusted --
execute \
  if score #egg:math/fixed/sin_cos_tan|>>unit~adjusted -- = #egg|unit~fixed -- \
  if function egg:math/fixed/double_from_fixed \
    run return run data modify storage egg:math/sin_cos_tan >>tan~double set from storage egg:math/fixed/double_from_fixed >>~double

scoreboard players operation #egg:math/fixed/double_from_halfixed|<<~halfixed -- = #egg:math/fixed/sin_cos_tan|>>tan~adjusted --
execute \
  if score #egg:math/fixed/sin_cos_tan|>>unit~adjusted -- = #egg|unit~halfixed -- \
  if function egg:math/fixed/double_from_halfixed \
    run return run data modify storage egg:math/sin_cos_tan >>tan~double set from storage egg:math/fixed/double_from_fixed >>~double

execute store result storage egg:math/sin_cos_tan >>tan~double double 1 run scoreboard players get #egg:math/fixed/sin_cos_tan|>>tan~adjusted --

## Success.
return 1
