## Get radians from degrees.
# score <<degree~fixed  <<| degrees ~fixed
# return                >>| radians ~fixed

## Convert.
scoreboard players operation #egg:math/-/degree/to_radian|<<degree~fixed -- = #egg:math/fixed/radian|<<degree~fixed --
return run function egg:math/-/degree/to_radian
