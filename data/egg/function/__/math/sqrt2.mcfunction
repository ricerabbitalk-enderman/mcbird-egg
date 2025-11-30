

execute if score #egg:__/math/sqrt2|<<x -- matches 0..1 run return 1

## Set Value.
# x
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|x -- = #egg:__/math/sqrt2|<<x --
# unit
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|unit -- = #egg:__/math/sqrt2|<<unit --

## Initialize.
# previous
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|prev -- = #egg:__/math/__/loop_to_sqrt2|x --
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|prev -- /= #egg|2 --

return run function egg:__/math/__/loop_to_sqrt2