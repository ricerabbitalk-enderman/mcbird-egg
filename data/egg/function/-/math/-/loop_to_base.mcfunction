## Recursive while loop.
# While [x > base*2^2].
scoreboard players operation #egg:-/math/-/loop_to_base|base*2^2 -- = #egg:-/math/-/loop_to_base|base --
scoreboard players operation #egg:-/math/-/loop_to_base|base*2^2 -- *= #egg|2^2 --
execute unless score #egg:-/math/-/loop_to_base|x -- >= #egg:-/math/-/loop_to_base|base*2^2 -- \
  run return run scoreboard players get #egg:-/math/-/loop_to_base|base --

## Next base.
scoreboard players operation #egg:-/math/-/loop_to_base|base -- *= #egg|2^2 --
## Break (Digit limit).
execute if score #egg:-/math/-/loop_to_base|base -- >= #egg|2^30 -- \
  run return run scoreboard players get #egg:-/math/-/loop_to_base|base --

# Loop [Recursive call].
return run function egg:-/math/-/loop_to_base
