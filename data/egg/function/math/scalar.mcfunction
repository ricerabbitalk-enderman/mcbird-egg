## Get scalar from vector.
# storage <<x~double       <<| Coordinate x ~double
# storage <<y~double       <<| Coordinate y ~double
# storage <<x~double       <<| Coordinate x ~double
# storage >>scalar~double  >>| Scalar ~double
# return                   >>| Success

## Cast to fixed.
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/scalar <<x~double
execute store result score #egg:math/fixed/scalar|<<x~fixed -- run function egg:math/fixed/fixed_from_double
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/scalar <<y~double
execute store result score #egg:math/fixed/scalar|<<y~fixed -- run function egg:math/fixed/fixed_from_double
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:math/scalar <<z~double
execute store result score #egg:math/fixed/scalar|<<z~fixed -- run function egg:math/fixed/fixed_from_double

## Calculate.
execute store result score #egg:math/fixed/scalar|scalar~adjusted -- run function egg:math/fixed/scalar

## Cast to double.
# unit ~fixed
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:math/fixed/scalar|scalar~adjusted --
execute \
  if score #egg:math/fixed/scalar|>>unit~adjusted -- = #egg|unit~fixed -- \
  if function egg:math/fixed/double_from_fixed \
    run data modify storage egg:math/scalar >>scalar~double set from storage egg:math/fixed/double_from_fixed >>~double
tellraw @a {storage:"egg:math/fixed/double_from_fixed",nbt:">>~double"}
# unit ~halfixed
scoreboard players operation #egg:math/fixed/double_from_halfixed|<<~halfixed -- = #egg:math/fixed/scalar|scalar~adjusted --
execute \
  if score #egg:math/fixed/scalar|>>unit~adjusted -- = #egg|unit~halfixed -- \
  if function egg:math/fixed/double_from_halfixed \
    run data modify storage egg:math/scalar >>scalar~double set from storage egg:math/fixed/double_from_halfixed >>~double
tellraw @a {storage:"egg:math/fixed/double_from_halfixed",nbt:">>~double"}

## Failure.
return fail
