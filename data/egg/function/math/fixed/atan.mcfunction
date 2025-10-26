## Get simple arctan value.
# score <<m~fixed  <<| Slope m ~fixed
# return           >>| Arctan degrees value ~fixed

## Call.
scoreboard players operation #egg:-/math/abs|<<x -- = #egg:math/fixed/atan|<<m~fixed --
execute store result score #egg:-/math/atan|<<m~fixed -- run function egg:-/math/abs
execute store result score #egg:-/degree/from_radian|<<radian~fixed -- run function egg:-/math/atan
execute unless score #egg:math/fixed/atan|<<m~fixed -- matches 0.. run scoreboard players operation #egg:-/degree/from_radian|<<radian~fixed -- *= #egg|-1 --
## Convert to degrees.
return run function egg:-/degree/from_radian
