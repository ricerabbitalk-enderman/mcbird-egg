## Get rotation from motion.
# storage <<motion    <<| Motion data
# storage >>rotation  >>| Rotation data

## Fixed from double.
# x
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:3d/rotation_from_motion <<motion[0]
execute store result score #egg:3d/rotation_from_motion|x~fixed -- run function egg:math/fixed/fixed_from_double
# y
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:3d/rotation_from_motion <<motion[1]
execute store result score #egg:3d/rotation_from_motion|y~fixed -- run function egg:math/fixed/fixed_from_double
# z
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:3d/rotation_from_motion <<motion[2]
execute store result score #egg:3d/rotation_from_motion|z~fixed -- run function egg:math/fixed/fixed_from_double

## Get scalar.
scoreboard players operation #egg:math/fixed/scalar|<<x~fixed -- = #egg:3d/rotation_from_motion|x~fixed --
scoreboard players operation #egg:math/fixed/scalar|<<y~fixed -- = #egg:3d/rotation_from_motion|y~fixed --
scoreboard players operation #egg:math/fixed/scalar|<<z~fixed -- = #egg:3d/rotation_from_motion|z~fixed --
execute store result score #egg:3d/-/reciprocal_scalar|<<scalar~adjusted -- run function egg:math/fixed/scalar

## Get reciprocal.
scoreboard players operation #egg:3d/-/reciprocal_scalar|<<unit~adjusted -- = #egg:math/fixed/scalar|>>unit~adjusted --
execute store result score #egg:3d/rotation_from_motion|1/scalar~fixed -- run function egg:3d/-/reciprocal_scalar

## Get unit coordinates.
# unit-x
scoreboard players operation #egg:3d/rotation_from_motion|unit_x~fixed -- = #egg:3d/rotation_from_motion|x~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|unit_x~fixed -- *= #egg:3d/rotation_from_motion|1/scalar~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|unit_x~fixed -- /= #egg|unit~fixed --
# unit-y
scoreboard players operation #egg:3d/rotation_from_motion|unit_y~fixed -- = #egg:3d/rotation_from_motion|y~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|unit_y~fixed -- *= #egg:3d/rotation_from_motion|1/scalar~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|unit_y~fixed -- /= #egg|unit~fixed --
# unit-z
scoreboard players operation #egg:3d/rotation_from_motion|unit_z~fixed -- = #egg:3d/rotation_from_motion|z~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|unit_z~fixed -- *= #egg:3d/rotation_from_motion|1/scalar~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|unit_z~fixed -- /= #egg|unit~fixed --

## Get yaw angle.
# atan
scoreboard players operation #egg:math/fixed/atan2|<<x~fixed -- = #egg:3d/rotation_from_motion|unit_z~fixed --
scoreboard players operation #egg:math/fixed/atan2|<<y~fixed -- = #egg:3d/rotation_from_motion|unit_x~fixed --
execute store result score #egg:math/fixed/degree|<<radian~fixed -- run function egg:math/fixed/atan2
# to degrees
execute store result score #egg:3d/rotation_from_motion|yaw~fixed -- run function egg:math/fixed/degree
scoreboard players operation #egg:3d/rotation_from_motion|yaw~fixed -- *= #egg|-1 --

## Get pitch angle.
# asin
scoreboard players operation #egg:math/fixed/asin_acos|<<x~fixed -- = #egg:3d/rotation_from_motion|unit_y~fixed --
function egg:math/fixed/asin_acos
# to degrees
scoreboard players operation #egg:math/fixed/degree|<<radian~fixed -- = #egg:math/fixed/asin_acos|>>asin~fixed --
execute store result score #egg:3d/rotation_from_motion|pitch~fixed -- run function egg:math/fixed/degree
scoreboard players operation #egg:3d/rotation_from_motion|pitch~fixed -- *= #egg|-1 --

## Fixed to double.
data modify storage egg:3d/rotation_from_motion >>rotation set value []
# yaw angle
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:3d/rotation_from_motion|yaw~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:3d/rotation_from_motion >>rotation append from storage egg:math/fixed/double_from_fixed >>~double
# pitch angle
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:3d/rotation_from_motion|pitch~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:3d/rotation_from_motion >>rotation append from storage egg:math/fixed/double_from_fixed >>~double

## Success.
return 1