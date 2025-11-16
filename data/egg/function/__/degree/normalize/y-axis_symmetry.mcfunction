## Normalize y-axis symmetry.
# score <<degree~fixed  <<| Limited degrees (0 <= θ < 180) ~fixed
# return                >>| Normalized degrees (0 <= θ < 90) ~fixed

## Supported 0 <= θ < 180.
execute if score #egg:__/degree/normalize/y-axis_symmetry|<<degree~fixed -- < #egg|0~fixed -- run return fail
execute if score #egg|180~fixed -- <= #egg:__/degree/normalize/y-axis_symmetry|<<degree~fixed -- run return fail

## Normalize.
# 0 <= θ < 90
execute if score #egg:__/degree/normalize/y-axis_symmetry|<<degree~fixed -- < #egg|90~fixed -- \
  run return run scoreboard players get #egg:__/degree/normalize/y-axis_symmetry|<<degree~fixed --
# 90 <= θ < 180
scoreboard players operation #egg:__/degree/normalize/y-axis_symmetry|degree~fixed -- = #egg|180~fixed --
return run scoreboard players operation #egg:__/degree/normalize/y-axis_symmetry|degree~fixed -- -= #egg:__/degree/normalize/y-axis_symmetry|<<degree~fixed --
