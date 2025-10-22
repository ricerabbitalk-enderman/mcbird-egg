## Degrees to radians.
# score <<degree~fixed  <<| Degrees value ~fixed
# return                >>| Radians value ~fixed

## Convert.
## to Radian = Degree * pi/180(=0.01745329252).
execute store result storage egg:operation scale double 0.01745329252 run scoreboard players get #egg:math/-/degree/to_radian|<<degree~fixed --
return run data get storage egg:operation scale
