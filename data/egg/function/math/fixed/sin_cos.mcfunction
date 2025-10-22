## Get sin and cos.
# score <<degree~fixed  <<| Unlimited degrees ~fixed
# score >>sin~fixed     >>| Sin value ~fixed
# score >>cos~fixed     >>| Cos value ~fixed
# return                >>| Success

## Get radians from degrees.
# Normalize to (0 <= θ < 360).
scoreboard players operation #egg:math/-/degree/normalize/360_periodicity|<<degree~fixed -- = #egg:math/fixed/sin_cos|<<degree~fixed --
execute store result score #egg:math/fixed/sin_cos|degree(<360)~fixed -- run function egg:math/-/degree/normalize/360_periodicity
# Normalize to (0 <= θ < 90).
scoreboard players operation #egg:math/-/degree/normalize/x-axis_symmetry|<<degree~fixed -- = #egg:math/fixed/sin_cos|degree(<360)~fixed --
execute store result score #egg:math/-/degree/normalize/y-axis_symmetry|<<degree~fixed -- run function egg:math/-/degree/normalize/x-axis_symmetry
execute store result score #egg:math/fixed/sin_cos|degree(<90)~fixed -- run function egg:math/-/degree/normalize/y-axis_symmetry
# Normalize to (0 <= θ <= 45).
scoreboard players operation #egg:math/-/degree/normalize/y-x_symmetry|<<degree~fixed -- = #egg:math/fixed/sin_cos|degree(<90)~fixed --
execute store result score #egg:math/fixed/sin_cos|degree(<=45)~fixed -- run function egg:math/-/degree/normalize/y-x_symmetry
# Get region.
scoreboard players operation #egg:math/-/degree/region|<<degree~fixed -- = #egg:math/fixed/sin_cos|degree(<360)~fixed -- 
execute store result score #egg:math/fixed/sin_cos|region -- run function egg:math/-/degree/region
# to Radian.
scoreboard players operation #egg:math/-/degree/to_radian|<<degree~fixed -- = #egg:math/fixed/sin_cos|degree(<=45)~fixed --
execute store result score #egg:math/-/trig/sin_cos|<<radian~fixed -- run function egg:math/-/degree/to_radian

## Get sin and cos.
function egg:math/-/trig/sin_cos

## Set result.
scoreboard players operation #egg:math/fixed/sin_cos|>>sin~fixed -- = #egg:math/-/trig/sin_cos|>>sin~fixed --
scoreboard players operation #egg:math/fixed/sin_cos|>>cos~fixed -- = #egg:math/-/trig/sin_cos|>>cos~fixed --

## Swap sin and cos if 45 < θ < 90
execute if score #egg|45~fixed -- < #egg:math/fixed/sin_cos|degree(<90)~fixed -- \
  run scoreboard players operation #egg:math/fixed/sin_cos|>>sin~fixed -- >< #egg:math/fixed/sin_cos|>>cos~fixed --

## Inverse sign if axis symmetry.
# sin (symmetry by axis x)
execute if score #egg:math/fixed/sin_cos|region -- matches 3..4 \
  run scoreboard players operation #egg:math/fixed/sin_cos|>>sin~fixed -- *= #egg|-1 --
# cos (symmetry by axis y)
execute if score #egg:math/fixed/sin_cos|region -- matches 2..3 \
  run scoreboard players operation #egg:math/fixed/sin_cos|>>cos~fixed -- *= #egg|-1 --

## Success.
return 1
