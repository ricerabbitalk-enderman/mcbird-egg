## Verify.
execute unless data storage egg:math/atan2 <<x~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/atan2 (2): storage not found (storage egg:math/atan2 <<x~double)",storage:"egg:math/atan2",nbt:"<<x~double"}
execute unless data storage egg:math/atan2 <<y~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/atan2 (3): storage not found (storage egg:math/atan2 <<y~double)",storage:"egg:math/atan2",nbt:"<<y~double"}

## Cast to fixed.
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:math/atan2 <<x~double
execute store result score #egg:math/fixed/atan2|<<x~fixed -- run function egg:__/point/fixed/from_double
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:math/atan2 <<y~double
execute store result score #egg:math/fixed/atan2|<<y~fixed -- run function egg:__/point/fixed/from_double

## Calculate.
execute store result score #egg:__/point/fixed/to_double|<<~fixed -- run function egg:math/fixed/atan2

## Cast to double.
# arctan
function egg:__/point/fixed/to_double
data modify storage egg:math/atan2 >>atan~double set from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1
