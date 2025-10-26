## Normalize y=x symmetry.
# score <<degree~fixed <<| Limited degrees (0 <= θ < 90) ~fixed
# return               >>| Normalized degrees (0<= θ <= 45) ~fixed

## Supported 0 <= θ < 90.
execute if score #egg:-/degree/normalize/y-x_symmetry|<<degree~fixed -- < #egg|0~fixed -- run return fail
execute if score #egg|90~fixed -- < #egg:-/degree/normalize/y-x_symmetry|<<degree~fixed -- run return fail

## Normalize.
# 0 <= θ <= 45
execute if score #egg:-/degree/normalize/y-x_symmetry|<<degree~fixed -- <= #egg|45~fixed -- \
  run return run scoreboard players get #egg:-/degree/normalize/y-x_symmetry|<<degree~fixed --
# 45 < θ < 90
scoreboard players operation #egg:-/degree/normalize/y-x_symmetry|degree~fixed -- = #egg|90~fixed --
return run scoreboard players operation #egg:-/degree/normalize/y-x_symmetry|degree~fixed -- -= #egg:-/degree/normalize/y-x_symmetry|<<degree~fixed --
