## Cast ~adjusted to ~fixed
# score <<~adjusted      <<| Adjusted Value
# score <<unit~adjusted  <<| Adjusted Unit
# return                 >>| Fixed Value

## Get Parameters.
scoreboard players operation #egg:__/point/adjusted/to_fixed|~adjusted -- = #egg:__/point/adjusted/to_fixed|<<~adjusted --
scoreboard players operation #egg:__/point/adjusted/to_fixed|unit~adjusted -- = #egg:__/point/adjusted/to_fixed|<<unit~adjusted --

## Limit.
# max
scoreboard players operation #egg:__/point/adjusted/to_fixed|max~adjusted -- = #egg|FIXED_LIMIT_FIXED_TO_ADJUSTED --
execute if score #egg:__/point/adjusted/to_fixed|unit~adjusted -- = #egg|unit~halfixed -- \
  run scoreboard players operation #egg:__/point/adjusted/to_fixed|max~adjusted -- = #egg|HALFIXED_LIMIT_FIXED_TO_ADJUSTED --
execute if score #egg:__/point/adjusted/to_fixed|unit~adjusted -- = #egg|unit~int -- \
  run scoreboard players operation #egg:__/point/adjusted/to_fixed|max~adjusted -- = #egg|INT_LIMIT_FIXED_TO_ADJUSTED --
# min
scoreboard players operation #egg:__/point/adjusted/to_fixed|min~adjusted -- = #egg:__/point/adjusted/to_fixed|max~adjusted --
scoreboard players operation #egg:__/point/adjusted/to_fixed|min~adjusted -- *= #egg|-1 --
# correct
execute if score #egg:__/point/adjusted/to_fixed|~adjusted -- > #egg:__/point/adjusted/to_fixed|max~adjusted -- \
  run scoreboard players operation #egg:__/point/adjusted/to_fixed|~adjusted -- = #egg:__/point/adjusted/to_fixed|max~adjusted --
execute if score #egg:__/point/adjusted/to_fixed|~adjusted -- < #egg:__/point/adjusted/to_fixed|min~adjusted -- \
  run scoreboard players operation #egg:__/point/adjusted/to_fixed|~adjusted -- = #egg:__/point/adjusted/to_fixed|min~adjusted --

## Cast factor.
scoreboard players operation #egg:__/point/adjusted/to_fixed|cast -- = #egg|unit~fixed --
scoreboard players operation #egg:__/point/adjusted/to_fixed|cast -- /= #egg:__/point/adjusted/to_fixed|unit~adjusted --

## to ~adjusted.
scoreboard players operation #egg:__/point/adjusted/to_fixed|>>~fixed -- = #egg:__/point/adjusted/to_fixed|~adjusted --
return run scoreboard players operation #egg:__/point/adjusted/to_fixed|>>~fixed -- *= #egg:__/point/adjusted/to_fixed|cast --
