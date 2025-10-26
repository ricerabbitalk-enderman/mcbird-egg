## Get simple arctan value.
# score <<m~fixed  <<| Slope m ~fixed
# return           >>| Arctan value ~fixed

## Plain atan.
scoreboard players operation #egg:-/math/atan_calculate|<<m~fixed -- = #egg:-/math/atan|<<m~fixed --
execute \
  if score #egg:-/math/atan|<<m~fixed -- <= #egg|1~fixed -- \
  if score #egg:-/math/atan|<<m~fixed -- >= #egg|-1~fixed -- \
    run return run function egg:-/math/atan_calculate

## Optimiazed atan.
scoreboard players operation #egg:-/math/atan_optimized|<<m~fixed -- = #egg:-/math/atan|<<m~fixed --
return run function egg:-/math/atan_optimized
