## Verify.
execute unless data storage egg:3d/motion_from_rotation <<rotation run return run function egg:__/error/throw {message:"[ERROR] function egg:3d/motion_from_rotation (2): storage not found (storage egg:3d/motion_from_rotation <<rotation)",storage:"egg:3d/motion_from_rotation",nbt:"<<rotation"}
execute unless data storage egg:3d/motion_from_rotation >>motion run return run function egg:__/error/throw {message:"[ERROR] function egg:3d/motion_from_rotation (3): storage not found (storage egg:3d/motion_from_rotation >>motion)",storage:"egg:3d/motion_from_rotation",nbt:">>motion"}

## Fixed from double.
# yaw angle
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:3d/motion_from_rotation <<rotation[0]
execute store result score #egg:3d/motion_from_rotation|yaw~fixed -- run function egg:__/point/fixed/from_double
# pitch angle
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:3d/motion_from_rotation <<rotation[1]
execute store result score #egg:3d/motion_from_rotation|pitch~fixed -- run function egg:__/point/fixed/from_double

## Sin and cos values from yaw angle.
scoreboard players operation #egg:math/fixed/sin_cos|<<degree~fixed -- = #egg:3d/motion_from_rotation|yaw~fixed --
function egg:math/fixed/sin_cos
scoreboard players operation #egg:3d/motion_from_rotation|sin_yaw~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|cos_yaw~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --

## Sin and cos values from pitch angle.
scoreboard players operation #egg:math/fixed/sin_cos|<<degree~fixed -- = #egg:3d/motion_from_rotation|pitch~fixed --
function egg:math/fixed/sin_cos
scoreboard players operation #egg:3d/motion_from_rotation|sin_pitch~fixed -- = #egg:math/fixed/sin_cos|>>sin~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|cos_pitch~fixed -- = #egg:math/fixed/sin_cos|>>cos~fixed --

## to Motion.
# x = -(sin(yaw) * sin(pitch))
scoreboard players operation #egg:3d/motion_from_rotation|x~fixed -- = #egg:3d/motion_from_rotation|sin_yaw~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|x~fixed -- *= #egg:3d/motion_from_rotation|cos_pitch~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|x~fixed -- *= #egg|-1 --
scoreboard players operation #egg:3d/motion_from_rotation|x~fixed -- /= #egg|unit~fixed --
# y = -sin(pitch)
scoreboard players operation #egg:3d/motion_from_rotation|y~fixed -- = #egg:3d/motion_from_rotation|sin_pitch~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|y~fixed -- *= #egg|-1 --
# z = -(cos(ywa) * cos(pitch))
scoreboard players operation #egg:3d/motion_from_rotation|z~fixed -- = #egg:3d/motion_from_rotation|cos_yaw~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|z~fixed -- *= #egg:3d/motion_from_rotation|cos_pitch~fixed --
scoreboard players operation #egg:3d/motion_from_rotation|z~fixed -- /= #egg|unit~fixed --

## Fixed to double.
data modify storage egg:3d/motion_from_rotation >>motion set value []
# x
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:3d/motion_from_rotation|x~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:3d/motion_from_rotation >>motion append from storage egg:__/point/fixed/to_double >>~double
# y
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:3d/motion_from_rotation|y~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:3d/motion_from_rotation >>motion append from storage egg:__/point/fixed/to_double >>~double
# z
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:3d/motion_from_rotation|z~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:3d/motion_from_rotation >>motion append from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1