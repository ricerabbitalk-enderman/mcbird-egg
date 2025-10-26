## Get rotation from motion.
# storage <<motion    <<| Motion data
# storage >>rotation  >>| Rotation data

## Fixed from double.
# x
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:3d/rotation_from_motion <<motion[0]
execute store result score #egg:3d/rotation_from_motion|x~fixed -- run function egg:-/point/fixed/from_double
# y
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:3d/rotation_from_motion <<motion[1]
execute store result score #egg:3d/rotation_from_motion|y~fixed -- run function egg:-/point/fixed/from_double
# z
data modify storage egg:-/point/fixed/from_double <<~double set from storage egg:3d/rotation_from_motion <<motion[2]
execute store result score #egg:3d/rotation_from_motion|z~fixed -- run function egg:-/point/fixed/from_double

## Get scalar.
scoreboard players operation #egg:-/math/scalar|<<x~fixed -- = #egg:3d/rotation_from_motion|x~fixed --
scoreboard players operation #egg:-/math/scalar|<<y~fixed -- = #egg:3d/rotation_from_motion|y~fixed --
scoreboard players operation #egg:-/math/scalar|<<z~fixed -- = #egg:3d/rotation_from_motion|z~fixed --
execute store result score #egg:3d/rotation_from_motion|scalar~fixed -- run function egg:-/math/scalar

## Get unit coordinates.
# unit-x
scoreboard players operation #egg:-/operation/devide|<<x~fixed -- = #egg:3d/rotation_from_motion|x~fixed --
scoreboard players operation #egg:-/operation/devide|<<y~fixed -- = #egg:3d/rotation_from_motion|scalar~fixed --
execute store result score #egg:3d/rotation_from_motion|unit_x~fixed -- run function egg:-/operation/devide
# unit-y
scoreboard players operation #egg:-/operation/devide|<<x~fixed -- = #egg:3d/rotation_from_motion|y~fixed --
scoreboard players operation #egg:-/operation/devide|<<y~fixed -- = #egg:3d/rotation_from_motion|scalar~fixed --
execute store result score #egg:3d/rotation_from_motion|unit_y~fixed -- run function egg:-/operation/devide
# unit-z
scoreboard players operation #egg:-/operation/devide|<<x~fixed -- = #egg:3d/rotation_from_motion|z~fixed --
scoreboard players operation #egg:-/operation/devide|<<y~fixed -- = #egg:3d/rotation_from_motion|scalar~fixed --
execute store result score #egg:3d/rotation_from_motion|unit_z~fixed -- run function egg:-/operation/devide

## Get yaw angle.
# atan
scoreboard players operation #egg:math/fixed/atan2|<<x~fixed -- = #egg:3d/rotation_from_motion|unit_z~fixed --
scoreboard players operation #egg:math/fixed/atan2|<<y~fixed -- = #egg:3d/rotation_from_motion|unit_x~fixed --
execute store result score #egg:3d/rotation_from_motion|yaw~fixed -- run function egg:math/fixed/atan2
# yaw
scoreboard players operation #egg:3d/rotation_from_motion|yaw~fixed -- *= #egg|-1 --

## Get pitch angle.
# asin
scoreboard players operation #egg:math/fixed/asin_acos|<<x~fixed -- = #egg:3d/rotation_from_motion|unit_y~fixed --
function egg:math/fixed/asin_acos
# pitch
scoreboard players operation #egg:3d/rotation_from_motion|pitch~fixed -- = #egg:math/fixed/asin_acos|>>asin~fixed --
scoreboard players operation #egg:3d/rotation_from_motion|pitch~fixed -- *= #egg|-1 --

## Fixed to double.
data modify storage egg:3d/rotation_from_motion >>rotation set value []
# yaw angle
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:3d/rotation_from_motion|yaw~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:3d/rotation_from_motion >>rotation append from storage egg:-/point/fixed/to_double >>~double
# pitch angle
scoreboard players operation #egg:-/point/fixed/to_double|<<~fixed -- = #egg:3d/rotation_from_motion|pitch~fixed --
function egg:-/point/fixed/to_double
data modify storage egg:3d/rotation_from_motion >>rotation append from storage egg:-/point/fixed/to_double >>~double

## Success.
return 1

