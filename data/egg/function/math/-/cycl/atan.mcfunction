## Get arctan value from slope value.
# score <<m~fixed  <<| slope value m ~fixed
# return           >>| Atan value ~fixed

## Calculate by mcloughlin's series (0.0 <= x < 0.5).
scoreboard players operation #egg:math/-/cycl/atan_series|<<m~fixed -- = #egg:math/-/cycl/atan|<<m~fixed --
execute if score #egg:math/-/cycl/atan_series|<<m~fixed -- < #egg|1/2~fixed -- run return run function egg:math/-/cycl/atan_series

## Calculate by gauss's continued fraction (0.5 <= x <= 1.0).
scoreboard players operation #egg:math/-/cycl/atan_fraction|<<m~fixed -- = #egg:math/-/cycl/atan|<<m~fixed --
execute if score #egg:math/-/cycl/atan_fraction|<<m~fixed -- >= #egg|1/2~fixed -- run return run function egg:math/-/cycl/atan_fraction
