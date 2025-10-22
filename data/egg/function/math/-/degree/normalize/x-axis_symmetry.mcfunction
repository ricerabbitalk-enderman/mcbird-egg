## Normalize x-axis symmetry.
# score <<degree~fixed  <<| Limited degrees (0 <= θ < 360) ~fixed
# return                >>| Normalized degrees (0 <= θ < 180) ~fixed

## Supported 0 <= θ < 360.
execute if score #egg:math/-/degree/normalize/x-axis_symmetry|<<degree~fixed -- < #egg|0~fixed -- run return fail
execute if score #egg|360~fixed -- <= #egg:math/-/degree/normalize/x-axis_symmetry|<<degree~fixed -- run return fail

## Normalize.
# 0 <= θ < 180
execute if score #egg:math/-/degree/normalize/x-axis_symmetry|<<degree~fixed -- < #egg|180~fixed -- \
  run return run scoreboard players get #egg:math/-/degree/normalize/x-axis_symmetry|<<degree~fixed --
# 180 <= θ < 360
scoreboard players operation #egg:math/-/degree/normalize/x-axis_symmetry|>>degree~fixed -- = #egg|360~fixed --
return run scoreboard players operation #egg:math/-/degree/normalize/x-axis_symmetry|>>degree~fixed -- -= #egg:math/-/degree/normalize/x-axis_symmetry|<<degree~fixed --
