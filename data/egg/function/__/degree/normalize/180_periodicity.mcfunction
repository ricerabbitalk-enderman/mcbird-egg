## Normalize by 180 degrees periodicity.
# score <<degree~fixed  <<| Limitless degrees ~fixed
# return                >>| Normalized degrees (0 <= θ < 180) ~fixed

## Normalize.
# Convert degrees within 0 <= θ < 180.
scoreboard players operation #egg:__/degree/normalize/180_periodicity|degree~fixed -- = #egg:__/degree/normalize/180_periodicity|<<degree~fixed --
# θ = θ % 180
scoreboard players operation #egg:__/degree/normalize/180_periodicity|degree~fixed -- %= #egg|180~fixed --
# If -180 < θ < 0 then θ = θ + 180
execute unless score #egg:__/degree/normalize/180_periodicity|degree~fixed -- matches 0.. \
  run scoreboard players operation #egg:__/degree/normalize/180_periodicity|degree~fixed -- += #egg|180~fixed --
# Return
return run scoreboard players get #egg:__/degree/normalize/180_periodicity|degree~fixed --
