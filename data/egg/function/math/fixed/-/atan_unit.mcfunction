## Get atan unit
# score <<x~fixed  <<| Coordinate x value ~fixed
# score <<y~fixed  >>| Coordinate y value ~fixed
# return           <<| Unit ~adjusted

## Get |x| and |y|.
# |x|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/atan_unit|<<x~fixed --
execute store result score #egg:math/fixed/-/atan_unit|abs_x~fixed -- run function egg:math/abs
# |y|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/atan_unit|<<y~fixed --
execute store result score #egg:math/fixed/-/atan_unit|abs_y~fixed -- run function egg:math/abs

## unit ~fixed
execute \
  if score #egg:math/fixed/-/atan_unit|abs_x~fixed -- <= #egg|MAX~fixed -- \
  if score #egg:math/fixed/-/atan_unit|abs_y~fixed -- <= #egg|MAX~fixed -- \
    run return run scoreboard players get #egg|unit~fixed --

## Get |x|~halfixed and |y|~halfixed.
# bit shift right
scoreboard players operation #egg:math/fixed/-/atan_unit|bit_shift_right -- = #egg|unit~fixed --
scoreboard players operation #egg:math/fixed/-/atan_unit|bit_shift_right -- /= #egg|unit~halfixed --
# |x| ~fixed to |x| ~halfixed
scoreboard players operation #egg:math/fixed/-/atan_unit|abs_x~halfixed -- = #egg:math/fixed/-/atan_unit|abs_x~fixed --
scoreboard players operation #egg:math/fixed/-/atan_unit|abs_x~halfixed -- /= #egg:math/fixed/-/atan_unit|bit_shift_right --
# |y| ~fixed to |y| ~halfixed
scoreboard players operation #egg:math/fixed/-/atan_unit|abs_y~halfixed -- = #egg:math/fixed/-/atan_unit|abs_y~fixed --
scoreboard players operation #egg:math/fixed/-/atan_unit|abs_y~halfixed -- /= #egg:math/fixed/-/atan_unit|bit_shift_right --

## unit ~halfixed
execute \
  if score #egg:math/fixed/-/atan_unit|abs_x~halfixed -- <= #egg|MAX~halfixed -- \
  if score #egg:math/fixed/-/atan_unit|abs_y~halfixed -- <= #egg|MAX~halfixed -- \
    run return run scoreboard players get #egg|unit~halfixed --

## Evaluate it as a very large value and use int.
return 1