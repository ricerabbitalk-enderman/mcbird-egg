## Degrees from radians.
# score <<radian~fixed  <<| Radians value ~fixed
# return                >>| Degrees value ~fixed

## Convert.
## to Degree = Radian * 180/pi(=57.29577951).
execute store result storage egg:operation scale double 57.29577951 run scoreboard players get #egg:math/-/degree/from_radian|<<radian~fixed --
return run data get storage egg:operation scale
