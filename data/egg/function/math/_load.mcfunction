## Settings.
scoreboard players operation #egg:settings|FIXED_UNIT -- = #egg|2^12 --
scoreboard players operation #egg:settings|HALFIXED_UNIT -- = #egg|2^6 --
scoreboard players operation #egg:settings|FIXED_POINT_ASSEPTABLE_LIMIT -- = #egg|2^30 --
scoreboard players operation #egg:settings|FIXED_POINT_CULCLATABLE_LIMIT -- = #egg|2^15 --

##------------------------------

## Fixed point asseptable limit.
# Only addition and subtraction operations certified not to exceed this value are permitted.
# max
scoreboard players operation #egg|FIXED_POINT_ASSEPTABLE_MAX -- = #egg:settings|FIXED_POINT_ASSEPTABLE_LIMIT --
# min
scoreboard players operation #egg|FIXED_POINT_ASSEPTABLE_MIN -- = #egg:settings|FIXED_POINT_ASSEPTABLE_MAX --
scoreboard players operation #egg|FIXED_POINT_ASSEPTABLE_MIN -- *= #egg|-1 --

## Fixed point calculatable limit.
# Operations between values not exceeding this limit are possible.
# max
scoreboard players operation #egg|FIXED_POINT_CULCLATABLE_MAX -- = #egg:settings|FIXED_POINT_CULCLATABLE_LIMIT --
# min
scoreboard players operation #egg|FIXED_POINT_CULCLATABLE_MIN -- = #egg:settings|FIXED_POINT_CULCLATABLE_MAX --
scoreboard players operation #egg|FIXED_POINT_CULCLATABLE_MIN -- *= #egg|-1 --

## unit ~halfixed
# unit ~halfixed
scoreboard players operation #egg|unit~halfixed -- = #egg:settings|HALFIXED_UNIT --
# Unit^2 ~halfixed
scoreboard players operation #egg|unit^2~halfixed -- = #egg|unit~halfixed --
scoreboard players operation #egg|unit^2~halfixed -- *= #egg|unit~halfixed --

## MIN/MAX
# MAX_INT, max integer of ~halfixed.
scoreboard players operation #egg|MAX_INT~halfixed -- = #egg|FIXED_POINT_CULCLATABLE_MAX --
scoreboard players operation #egg|MAX_INT~halfixed -- /= #egg|unit~halfixed --
# MIN_INT, min integer of ~halfixed.
scoreboard players operation #egg|MIX_INT~halfixed -- = #egg|MAX_INT~halfixed --
scoreboard players operation #egg|MIX_INT~halfixed -- *= #egg|-1 --

## unit ~fixed
# unit ~fixed
scoreboard players operation #egg|unit~fixed -- = #egg:settings|FIXED_UNIT --
# Unit^2 ~fixed
scoreboard players operation #egg|unit^2~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg|unit^2~fixed -- *= #egg|unit~fixed --

## MIN/MAX
# MAX_INT, max integer of ~fixed.
scoreboard players operation #egg|MAX_INT~fixed -- = #egg|FIXED_POINT_CULCLATABLE_MAX --
scoreboard players operation #egg|MAX_INT~fixed -- /= #egg|unit~fixed --
# MIN_INT, min integer of ~fixed.
scoreboard players operation #egg|MIX_INT~fixed -- = #egg|MAX_INT~fixed --
scoreboard players operation #egg|MIX_INT~fixed -- *= #egg|-1 --

## Number ~fixed.
# -1 ~fixed
scoreboard players operation #egg|-1~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg|-1~fixed -- *= #egg|-1 --
# 0 ~fixed
scoreboard players operation #egg|0~fixed -- = #egg|0 --
# 1 ~fixed
scoreboard players operation #egg|1~fixed -- = #egg|unit~fixed --
# 2 ~fixed
scoreboard players set #egg|2~fixed -- 2
scoreboard players operation #egg|2~fixed -- *= #egg|unit~fixed --
# 3 ~fixed
scoreboard players set #egg|3~fixed -- 3
scoreboard players operation #egg|3~fixed -- *= #egg|unit~fixed --
# 4 ~fixed
scoreboard players set #egg|4~fixed -- 4
scoreboard players operation #egg|4~fixed -- *= #egg|unit~fixed --
# 5 ~fixed
scoreboard players set #egg|5~fixed -- 5
scoreboard players operation #egg|5~fixed -- *= #egg|unit~fixed --
# 6 ~fixed
scoreboard players set #egg|6~fixed -- 6
scoreboard players operation #egg|6~fixed -- *= #egg|unit~fixed --
# 7 ~fixed
scoreboard players set #egg|7~fixed -- 7
scoreboard players operation #egg|7~fixed -- *= #egg|unit~fixed --
# 8 ~fixed
scoreboard players set #egg|8~fixed -- 8
scoreboard players operation #egg|8~fixed -- *= #egg|unit~fixed --
# 9 ~fixed
scoreboard players set #egg|9~fixed -- 9
scoreboard players operation #egg|9~fixed -- *= #egg|unit~fixed --
# 10 ~fixed
scoreboard players set #egg|10~fixed -- 10
scoreboard players operation #egg|10~fixed -- *= #egg|unit~fixed --
# 11 ~fixed
scoreboard players set #egg|11~fixed -- 11
scoreboard players operation #egg|11~fixed -- *= #egg|unit~fixed --
# 13 ~fixed
scoreboard players set #egg|13~fixed -- 13
scoreboard players operation #egg|13~fixed -- *= #egg|unit~fixed --
# 15 ~fixed
scoreboard players set #egg|15~fixed -- 15
scoreboard players operation #egg|15~fixed -- *= #egg|unit~fixed --

## Fraction
# 1/2 ~fixed
scoreboard players operation #egg|1/2~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg|1/2~fixed -- /= #egg|2 --
# 1/8 ~fixed
scoreboard players operation #egg|1/8~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg|1/8~fixed -- /= #egg|2^3 --
# -1/8 ~fixed
scoreboard players operation #egg|-1/8~fixed -- = #egg|unit~fixed --
scoreboard players operation #egg|-1/8~fixed -- /= #egg|2^3 --
scoreboard players operation #egg|-1/8~fixed -- *= #egg|-1 --

## Degrees
# 45 ~fixed
scoreboard players set #egg|45~fixed -- 45
scoreboard players operation #egg|45~fixed -- *= #egg|unit~fixed --
# 90 ~fixed
scoreboard players set #egg|90~fixed -- 90
scoreboard players operation #egg|90~fixed -- *= #egg|unit~fixed --
# 180 ~fixed
scoreboard players set #egg|180~fixed -- 180
scoreboard players operation #egg|180~fixed -- *= #egg|unit~fixed --
# 279 ~fixed
scoreboard players set #egg|270~fixed -- 270
scoreboard players operation #egg|270~fixed -- *= #egg|unit~fixed --
# 360 ~fixed
scoreboard players set #egg|360~fixed -- 360
scoreboard players operation #egg|360~fixed -- *= #egg|unit~fixed --

## pi ~fixed
# pi ~fixed
data modify storage egg:math/fixed/fixed_from_double <<~double set value 3.141592654
execute store result score #egg|pi~fixed -- run function egg:math/fixed/fixed_from_double
# pi * 1/4 ~fixed
scoreboard players operation #egg|pi*1/4~fixed -- = #egg|pi~fixed --
scoreboard players operation #egg|pi*1/4~fixed -- /= #egg|4 --
# pi * 1/2 ~fixed
scoreboard players operation #egg|pi*1/2~fixed -- = #egg|pi~fixed --
scoreboard players operation #egg|pi*1/2~fixed -- /= #egg|2 --
# pi * 3/2 ~fixed
scoreboard players operation #egg|pi*3/2~fixed -- = #egg|pi~fixed --
scoreboard players operation #egg|pi*3/2~fixed -- += #egg|pi*1/2~fixed --
# pi * 2 ~fixed
scoreboard players operation #egg|pi*2~fixed -- = #egg|pi~fixed --
scoreboard players operation #egg|pi*2~fixed -- *= #egg|2 --
# pi * -1/2 ~fixed
scoreboard players operation #egg|pi*-1/2~fixed -- = #egg|pi*1/2~fixed --
scoreboard players operation #egg|pi*-1/2~fixed -- /= #egg|-1 --
# 1/pi ~fixed
scoreboard players operation #egg|1/pi~fixed -- = #egg|unit^2~fixed --
scoreboard players operation #egg|1/pi~fixed -- /= #egg|pi~fixed --
# 180/pi ~fixed
scoreboard players operation #egg|180/pi~fixed -- = #egg|1/pi~fixed --
scoreboard players operation #egg|180/pi~fixed -- *= #egg|180 --
# pi/180 ~fixed
scoreboard players operation #egg|pi/180~fixed -- = #egg|pi~fixed --
scoreboard players operation #egg|pi/180~fixed -- /= #egg|180 --

## Sqrt ~fixed
# √(1/2)
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.7071067812
execute store result score #egg|SQRT(1/2)~fixed -- run function egg:math/fixed/fixed_from_double

## Coefficient
# 1/2!
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.5
execute store result score #egg|1/2!~fixed -- run function egg:math/fixed/fixed_from_double
# 1/3!
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.1666666667
execute store result score #egg|1/3!~fixed -- run function egg:math/fixed/fixed_from_double
# 1/4!
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.04166666667
execute store result score #egg|1/4!~fixed -- run function egg:math/fixed/fixed_from_double
# 1/5!
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.008333333333
execute store result score #egg|1/5!~fixed -- run function egg:math/fixed/fixed_from_double
# 1/6!
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.001388888889
execute store result score #egg|1/6!~fixed -- run function egg:math/fixed/fixed_from_double

# 1!!/(2!!*3)
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.1666666667
execute store result score #egg|1!!/(2!!*3)~fixed -- run function egg:math/fixed/fixed_from_double
# 3!!/(4!!*5)
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.075
execute store result score #egg|3!!/(4!!*5)~fixed -- run function egg:math/fixed/fixed_from_double
# 5!!/(6!!*7)
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.04464285714
execute store result score #egg|5!!/(6!!*7)~fixed -- run function egg:math/fixed/fixed_from_double
# 7!!/(8!!*9)
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.03038194444
execute store result score #egg|7!!/(8!!*9)~fixed -- run function egg:math/fixed/fixed_from_double
# 9!!/(10!!*11)
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.02237215909
execute store result score #egg|9!!/(10!!*11)~fixed -- run function egg:math/fixed/fixed_from_double

# 1/3
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.3333333333
execute store result score #egg|1/3~fixed -- run function egg:math/fixed/fixed_from_double
# 1/5
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.2
execute store result score #egg|1/5~fixed -- run function egg:math/fixed/fixed_from_double
# 1/7
data modify storage egg:math/fixed/fixed_from_double <<~double set value 0.1428571429
execute store result score #egg|1/7~fixed -- run function egg:math/fixed/fixed_from_double

# 6^2/11
data modify storage egg:math/fixed/fixed_from_double <<~double set value 2.769230769
execute store result score #egg|6^2/11~fixed -- run function egg:math/fixed/fixed_from_double

## Fixed side limit for calculation by pythagorean theorem.
# max
scoreboard players operation #egg|SCALAR_FIXED_SIDE_MAX -- = #egg|unit~fixed --
scoreboard players operation #egg|SCALAR_FIXED_SIDE_MAX -- *= #egg|MAX_INT~fixed --
scoreboard players operation #egg|SCALAR_FIXED_SIDE_MAX -- /= #egg|2^2 --
# min
scoreboard players operation #egg|SCALAR_FIXED_SIDE_MIN -- = #egg|SCALAR_FIXED_SIDE_MAX --
scoreboard players operation #egg|SCALAR_FIXED_SIDE_MIN -- *= #egg|-1 --

## Halfixed side max for calculation by pythagorean theorem.
# max
scoreboard players operation #egg|SCALAR_HALFIXED_SIDE_MAX -- = #egg|unit~fixed --
scoreboard players operation #egg|SCALAR_HALFIXED_SIDE_MAX -- *= #egg|MAX_INT~halfixed --
scoreboard players operation #egg|SCALAR_HALFIXED_SIDE_MAX -- /= #egg|2^2 --
# min
scoreboard players operation #egg|SCALAR_HALFIXED_SIDE_MIN -- = #egg|SCALAR_HALFIXED_SIDE_MAX --
scoreboard players operation #egg|SCALAR_HALFIXED_SIDE_MIN -- *= #egg|-1 --
