## Cast ~adjusted from ~fixed
# score <<~fixed  <<| Fixed Value
# score >>unit    >>| Adjusted Unit
# return          >>| Adjusted Value

## Get absolute value.
scoreboard players operation #egg:__/math/abs|<<x -- = #egg:__/point/adjusted/from_fixed|<<~fixed --
execute store result score #egg:__/point/adjusted/from_fixed|abs~fixed -- run function egg:__/math/abs

## Get Unit.
# ~int
scoreboard players operation #egg:__/point/adjusted/from_fixed|>>unit~adjusted -- = #egg|unit~int --
# ~halfixed
execute if score #egg:__/point/adjusted/from_fixed|abs~fixed -- <= #egg|HALFIXED_LIMIT_FIXED_TO_ADJUSTED -- \
  run scoreboard players operation #egg:__/point/adjusted/from_fixed|>>unit~adjusted -- = #egg|unit~halfixed --
# ~fixed
execute if score #egg:__/point/adjusted/from_fixed|abs~fixed -- <= #egg|FIXED_LIMIT_FIXED_TO_ADJUSTED -- \
  run scoreboard players operation #egg:__/point/adjusted/from_fixed|>>unit~adjusted -- = #egg|unit~fixed --

## Cast factor.
scoreboard players operation #egg:__/point/adjusted/from_fixed|cast -- = #egg|unit~fixed --
scoreboard players operation #egg:__/point/adjusted/from_fixed|cast -- /= #egg:__/point/adjusted/from_fixed|>>unit~adjusted --

## to ~adjusted.
scoreboard players operation #egg:__/point/adjusted/from_fixed|>>~adjusted -- = #egg:__/point/adjusted/from_fixed|<<~fixed --
return run scoreboard players operation #egg:__/point/adjusted/from_fixed|>>~adjusted -- /= #egg:__/point/adjusted/from_fixed|cast --
