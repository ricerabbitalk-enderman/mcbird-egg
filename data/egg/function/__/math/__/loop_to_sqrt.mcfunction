## Recursive while loop.
# While [base > 0].
execute unless score #egg:__/math/__/loop_to_sqrt|base -- matches 1.. \
  run return run scoreboard players get #egg:__/math/__/loop_to_sqrt|result --

## Extract a caluclation block.
# Get block.
scoreboard players operation #egg:__/math/__/loop_to_sqrt|block -- = #egg:__/math/__/loop_to_sqrt|x --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|block -- /= #egg:__/math/__/loop_to_sqrt|base --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|block -- %= #egg|2^2 --
# Move base.
scoreboard players operation #egg:__/math/__/loop_to_sqrt|base -- /= #egg|2^2 --

## Right result
# (right-a - right-b)*2^2 + block
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right -- = #egg:__/math/__/loop_to_sqrt|right-a --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right -- -= #egg:__/math/__/loop_to_sqrt|right-b --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right -- *= #egg|2^2 --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right -- += #egg:__/math/__/loop_to_sqrt|block --
## Left result
# (left-a + left-b)*2
scoreboard players operation #egg:__/math/__/loop_to_sqrt|left -- = #egg:__/math/__/loop_to_sqrt|left-a --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|left -- += #egg:__/math/__/loop_to_sqrt|left-b --
scoreboard players operation #egg:__/math/__/loop_to_sqrt|left -- *= #egg|2 --
# left+1
scoreboard players operation #egg:__/math/__/loop_to_sqrt|left+1 -- = #egg:__/math/__/loop_to_sqrt|left --
scoreboard players add #egg:__/math/__/loop_to_sqrt|left+1 -- 1

## if result of digit = 0
# right-a
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right-a -- = #egg:__/math/__/loop_to_sqrt|right --
# right-b
scoreboard players set #egg:__/math/__/loop_to_sqrt|right-b -- 0
# left-a
scoreboard players operation #egg:__/math/__/loop_to_sqrt|left-a -- = #egg:__/math/__/loop_to_sqrt|left --
# left-b
scoreboard players set #egg:__/math/__/loop_to_sqrt|left-b -- 0
# result
scoreboard players operation #egg:__/math/__/loop_to_sqrt|result -- *= #egg|2 --

## Result of digit = 0 and loop [Recursive call].
# left+1 > right
#   right-a = right
#   right-b = 0
#   left-a  = left
#   left-b  = 0
#   result  = result * 2 | shift a bit(digit) left
execute if score #egg:__/math/__/loop_to_sqrt|left+1 -- > #egg:__/math/__/loop_to_sqrt|right -- run return run function egg:__/math/__/loop_to_sqrt

## if result of digit = 1
# right-a
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right-a -- = #egg:__/math/__/loop_to_sqrt|right --
# right-b
scoreboard players operation #egg:__/math/__/loop_to_sqrt|right-b -- = #egg:__/math/__/loop_to_sqrt|left+1 --
# left-a
scoreboard players operation #egg:__/math/__/loop_to_sqrt|left-a -- = #egg:__/math/__/loop_to_sqrt|left+1 --
# left-b
scoreboard players set #egg:__/math/__/loop_to_sqrt|left-b -- 1
# result
scoreboard players add #egg:__/math/__/loop_to_sqrt|result -- 1

## Result of digit = 1 and loop [Recursive call].
# left+1 <= right
#   right-a = right
#   right-b = left+1
#   left-a  = left+1
#   left-b  = 1
#   result  = result * 2 + 1 | shift a bit(digit) left
return run function egg:__/math/__/loop_to_sqrt
