## Get simple arctan value.
# score <<m~fixed  <<| Slope m ~fixed
# return           >>| Arctan value ~fixed

## Plain atan.
scoreboard players operation #egg:__/math/atan_calculate|<<m~fixed -- = #egg:__/math/atan|<<m~fixed --
execute \
  if score #egg:__/math/atan|<<m~fixed -- <= #egg|1~fixed -- \
  if score #egg:__/math/atan|<<m~fixed -- >= #egg|-1~fixed -- \
    run return run function egg:__/math/atan_calculate

## Optimiazed atan.
scoreboard players operation #egg:__/math/atan_optimized|<<m~fixed -- = #egg:__/math/atan|<<m~fixed --
return run function egg:__/math/atan_optimized
