## Get tan unit ~adjusted. 
# score <<sin~fixed   <<| Sin value ~fixed
# score <<cos~fixed   >>| Cos value ~fixed
# return              <<| Unit ~adjusted

## Get |sin| and |cos|.
# |sin|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/tan_unit|<<sin~fixed --
execute store result score #egg:math/fixed/-/tan_unit|abs_sin~fixed -- run function egg:math/abs
# |cos|
scoreboard players operation #egg:math/abs|<<x -- = #egg:math/fixed/-/tan_unit|<<cos~fixed --
execute store result score #egg:math/fixed/-/tan_unit|abs_cos~fixed -- run function egg:math/abs

## If |sin| >= |cos|*MAX_INT~fixed, sin/cos do not overflow with ~fixed.
# |cos|*MAX_INT~fixed
scoreboard players operation #egg:math/fixed/-/tan_unit|MAX_INT*abs_cos~fixed -- = #egg:math/fixed/-/tan_unit|abs_cos~fixed --
scoreboard players operation #egg:math/fixed/-/tan_unit|MAX_INT*abs_cos~fixed -- *= #egg|MAX_INT~fixed --
# If it doesn't overflow, use ~fixed.
execute if score #egg:math/fixed/-/tan_unit|MAX_INT*abs_cos~fixed -- >= #egg:math/fixed/-/tan_unit|abs_sin~fixed -- \
  run return run scoreboard players get #egg|unit~fixed --

## Get |sin|~halfixed and |cos|~halfixed.
# bit shift
scoreboard players operation #egg:math/fixed/-/tan_unit|bit_shift_right -- = #egg|unit~fixed --
scoreboard players operation #egg:math/fixed/-/tan_unit|bit_shift_right -- /= #egg|unit~halfixed --
# |sin| ~fixed to |sin| ~halfixed
scoreboard players operation #egg:math/fixed/-/tan_unit|abs_sin~halfixed -- = #egg:math/fixed/-/tan_unit|abs_sin~fixed --
scoreboard players operation #egg:math/fixed/-/tan_unit|abs_sin~halfixed -- /= #egg:math/fixed/-/tan_unit|bit_shift_right --
# |cos| ~fixed to |cos| ~halfixed
scoreboard players operation #egg:math/fixed/-/tan_unit|abs_cos~halfixed -- = #egg:math/fixed/-/tan_unit|abs_cos~fixed --
scoreboard players operation #egg:math/fixed/-/tan_unit|abs_cos~halfixed -- /= #egg:math/fixed/-/tan_unit|bit_shift_right --
## If |sin| >= |cos|*MAX_INT~halfixed, sin/cos do not overflow with ~halfixed.
# |cos|*MAX_INT~halfixed
scoreboard players operation #egg:math/fixed/-/tan_unit|MAX_INT*abs_cos~halfixed -- = #egg:math/fixed/-/tan_unit|abs_cos~halfixed --
scoreboard players operation #egg:math/fixed/-/tan_unit|MAX_INT*abs_cos~halfixed -- *= #egg|MAX_INT~halfixed --
# If it doesn't overflow, use ~halfixed.
execute if score #egg:math/fixed/-/tan_unit|MAX_INT*abs_cos~halfixed -- >= #egg:math/fixed/-/tan_unit|abs_sin~halfixed -- \
  run return run scoreboard players get #egg|unit~halfixed --

## Evaluate it as a very large value and use int.
# This means that cos is a very small value that includes 0.
return 1