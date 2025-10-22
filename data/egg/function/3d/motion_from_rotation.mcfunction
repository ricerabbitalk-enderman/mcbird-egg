## Get motion from rotation.
# storage <<rotation  <<| Rotation data
# storage >>motion    >>| Motion data

## Fixed from double.
# yaw angle
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:3d/motion_from_rotation <<rotation[0]
execute store result score #egg:3d/motion_from_rotation|yaw~fixed -- run function egg:math/fixed/fixed_from_double
# pitch angle
data modify storage egg:math/fixed/fixed_from_double <<~double set from storage egg:3d/motion_from_rotation <<rotation[1]
execute store result score #egg:3d/motion_from_rotation|pitch~fixed -- run function egg:math/fixed/fixed_from_double

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
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:3d/motion_from_rotation|x~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:3d/motion_from_rotation >>motion append from storage egg:math/fixed/double_from_fixed >>~double
# y
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:3d/motion_from_rotation|y~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:3d/motion_from_rotation >>motion append from storage egg:math/fixed/double_from_fixed >>~double
# z
scoreboard players operation #egg:math/fixed/double_from_fixed|<<~fixed -- = #egg:3d/motion_from_rotation|z~fixed --
function egg:math/fixed/double_from_fixed
data modify storage egg:3d/motion_from_rotation >>motion append from storage egg:math/fixed/double_from_fixed >>~double

return 1