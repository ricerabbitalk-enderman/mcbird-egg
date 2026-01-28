## Verify.
execute unless data storage egg:math/sin_cos_tan <<degree~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/sin_cos_tan (2): storage not found (storage egg:math/sin_cos_tan <<degree~double)",storage:"egg:math/sin_cos_tan",nbt:"<<degree~double"}
execute unless data storage egg:math/sin_cos_tan >>sin~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/sin_cos_tan (3): storage not found (storage egg:math/sin_cos_tan >>sin~double)",storage:"egg:math/sin_cos_tan",nbt:">>sin~double"}
execute unless data storage egg:math/sin_cos_tan >>cos~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/sin_cos_tan (4): storage not found (storage egg:math/sin_cos_tan >>cos~double)",storage:"egg:math/sin_cos_tan",nbt:">>cos~double"}
execute unless data storage egg:math/sin_cos_tan >>tan~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/sin_cos_tan (5): storage not found (storage egg:math/sin_cos_tan >>tan~double)",storage:"egg:math/sin_cos_tan",nbt:">>tan~double"}

## Cast to fixed.
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:math/sin_cos_tan <<degree~double
execute store result score #egg:math/fixed/sin_cos_tan|<<degree~fixed -- run function egg:__/point/fixed/from_double

## Calculate.
function egg:math/fixed/sin_cos_tan

## Cast to double.
# sin
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>sin~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/sin_cos_tan >>sin~double set from storage egg:__/point/fixed/to_double >>~double
# cos
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>cos~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/sin_cos_tan >>cos~double set from storage egg:__/point/fixed/to_double >>~double
# tan
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/sin_cos_tan|>>tan~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/sin_cos_tan >>tan~double set from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1
