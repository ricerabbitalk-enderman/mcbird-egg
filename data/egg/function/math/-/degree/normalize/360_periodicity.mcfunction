## Normalize by 360 degrees periodicity.
# score <<degree~fixed  <<| Limitless degrees ~fixed
# return                >>| Normalized degrees (0 <= θ < 360) ~fixed

## Normalize.
# Convert degrees within 0 <= θ < 360.
scoreboard players operation #egg:math/-/degree/normalize/360_periodicity|degree~fixed -- = #egg:math/-/degree/normalize/360_periodicity|<<degree~fixed --
# θ = θ % 360
scoreboard players operation #egg:math/-/degree/normalize/360_periodicity|degree~fixed -- %= #egg|360~fixed --
# If -360 < θ < 0 then θ = θ + 360
execute unless score #egg:math/-/degree/normalize/360_periodicity|degree~fixed -- matches 0.. \
  run scoreboard players operation #egg:math/-/degree/normalize/360_periodicity|degree~fixed -- += #egg|360~fixed --
# Return
return run scoreboard players get #egg:math/-/degree/normalize/360_periodicity|degree~fixed --
