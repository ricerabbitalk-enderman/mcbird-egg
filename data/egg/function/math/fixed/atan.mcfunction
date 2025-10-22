## Get simple arctan value.
# score <<m~fixed  <<| Slope m ~fixed
# return           >>| Arctan value ~fixed

## Plain atan.
scoreboard players operation #egg:math/-/cycl/atan|<<m~fixed -- = #egg:math/fixed/atan|<<m~fixed --
execute \
  if score #egg:math/fixed/atan|<<m~fixed -- <= #egg|unit~fixed -- \
    run return run function egg:math/-/cycl/atan

## Optimiazed atan.
scoreboard players operation #egg:math/fixed/-/atan_optimized|<<m~fixed -- = #egg:math/fixed/atan|<<m~fixed --
execute \
  if score #egg:math/fixed/atan|<<m~fixed -- > #egg|unit~fixed -- \
    run return run function egg:math/fixed/-/atan_optimized
