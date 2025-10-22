## Get scalar unit
# score <<x~fixed  <<| Vector x value ~fixed
# score <<y~fixed  >>| Vector y value ~fixed
# score <<z~fixed  >>| Vector z value ~fixed
# return           <<| Unit ~adjusted

## Get |x| and |y| and |z|.
# |x|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/scalar_unit|<<x~fixed --
execute store result score #egg:math/fixed/-/scalar_unit|abs_x~fixed -- run function egg:math/abs
# |y|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/scalar_unit|<<y~fixed --
execute store result score #egg:math/fixed/-/scalar_unit|abs_y~fixed -- run function egg:math/abs
# |z|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/scalar_unit|<<z~fixed --
execute store result score #egg:math/fixed/-/scalar_unit|abs_z~fixed -- run function egg:math/abs

## ~adjusted
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>x~adjusted -- = #egg:math/fixed/-/scalar_unit|<<x~fixed --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>y~adjusted -- = #egg:math/fixed/-/scalar_unit|<<y~fixed --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>z~adjusted -- = #egg:math/fixed/-/scalar_unit|<<z~fixed --

## unit ~fixed
execute \
  if score #egg:math/fixed/-/scalar_unit|abs_x~fixed -- <= #egg|SCALAR_FIXED_SIDE_MAX -- \
  if score #egg:math/fixed/-/scalar_unit|abs_y~fixed -- <= #egg|SCALAR_FIXED_SIDE_MAX -- \
  if score #egg:math/fixed/-/scalar_unit|abs_z~fixed -- <= #egg|SCALAR_FIXED_SIDE_MAX -- \
    run return run scoreboard players get #egg|unit~fixed --

## Correct ~adujsted.
# bit shift rigth
scoreboard players operation #egg:math/fixed/-/scalar_unit|bit_shift_right -- = #egg|unit~fixed --
scoreboard players operation #egg:math/fixed/-/scalar_unit|bit_shift_right -- /= #egg|unit~halfixed --
# shift
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>x~adjusted -- /= #egg:math/fixed/-/scalar_unit|bit_shift_right --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>y~adjusted -- /= #egg:math/fixed/-/scalar_unit|bit_shift_right --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>z~adjusted -- /= #egg:math/fixed/-/scalar_unit|bit_shift_right --

## unit ~halfixed
execute \
  if score #egg:math/fixed/-/scalar_unit|abs_x~fixed -- <= #egg|SCALAR_HALFIXED_SIDE_MAX -- \
  if score #egg:math/fixed/-/scalar_unit|abs_y~fixed -- <= #egg|SCALAR_HALFIXED_SIDE_MAX -- \
  if score #egg:math/fixed/-/scalar_unit|abs_z~fixed -- <= #egg|SCALAR_HALFIXED_SIDE_MAX -- \
    run return run scoreboard players get #egg|unit~halfixed --

scoreboard players operation #egg:math/fixed/-/scalar_unit|>>x~adjusted -- < #egg|SCALAR_HALFIXED_SIDE_MAX --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>x~adjusted -- > #egg|SCALAR_HALFIXED_SIDE_MIN --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>y~adjusted -- < #egg|SCALAR_HALFIXED_SIDE_MAX --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>y~adjusted -- > #egg|SCALAR_HALFIXED_SIDE_MIN --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>z~adjusted -- < #egg|SCALAR_HALFIXED_SIDE_MAX --
scoreboard players operation #egg:math/fixed/-/scalar_unit|>>z~adjusted -- > #egg|SCALAR_HALFIXED_SIDE_MIN --

## unit ~int
return run scoreboard players get #egg|unit~halfixed --
