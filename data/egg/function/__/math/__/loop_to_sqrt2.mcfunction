scoreboard players operation #egg:__/math/__/loop_to_sqrt2|curr -- = #egg:__/math/__/loop_to_sqrt2|x --
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|curr -- *= #egg:__/math/__/loop_to_sqrt2|unit --
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|curr -- /= #egg:__/math/__/loop_to_sqrt2|prev --
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|curr -- += #egg:__/math/__/loop_to_sqrt2|prev --
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|curr -- /= #egg|2 --

scoreboard players operation #egg:__/math/__/loop_to_sqrt2|diff -- = #egg:__/math/__/loop_to_sqrt2|curr --
scoreboard players operation #egg:__/math/__/loop_to_sqrt2|diff -- -= #egg:__/math/__/loop_to_sqrt2|prev --
execute if score #egg:__/math/__/loop_to_sqrt2|diff -- matches -1..1 run return run scoreboard players get #egg:__/math/__/loop_to_sqrt2|curr --

scoreboard players operation #egg:__/math/__/loop_to_sqrt2|prev -- = #egg:__/math/__/loop_to_sqrt2|curr --
return run function egg:__/math/__/loop_to_sqrt2