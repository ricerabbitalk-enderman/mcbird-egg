## Verify.
execute unless data storage egg:math/sin_cos <<degree~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/sin_cos (2): storage not found (storage egg:math/sin_cos <<degree~double)",storage:"egg:math/sin_cos",nbt:"<<degree~double"}

## Cast to fixed.
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:math/sin_cos <<degree~double
execute store result score #egg:math/fixed/sin_cos|<<degree~fixed -- run function egg:__/point/fixed/from_double

## Calculate.
function egg:math/fixed/sin_cos

## Cast to double.
# sin
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/sin_cos >>sin~double set from storage egg:__/point/fixed/to_double >>~double
# cos
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/sin_cos >>cos~double set from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1
