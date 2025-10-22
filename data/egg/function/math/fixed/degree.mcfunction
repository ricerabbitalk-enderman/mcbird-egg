## Get degrees from radian.
# score <<radian~fixed  <<| radians ~fixed
# return                >>| degrees ~fixed

## Convert.
scoreboard players operation #egg:math/-/degree/from_radian|<<radian~fixed -- = #egg:math/fixed/degree|<<radian~fixed --
return run function egg:math/-/degree/from_radian
