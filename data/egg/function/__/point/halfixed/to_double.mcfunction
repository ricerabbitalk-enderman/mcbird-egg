## Cast ~halfixed to ~double.
# score <<~halfixed  <<| Halfixed value
# storage >>~double  >>| Double value

## Cast.
execute store result storage egg:__/point/halfixed/to_double >>~double double 0.015625 \
  run scoreboard players get #egg:__/point/halfixed/to_double|<<~halfixed --
## Success.
return 1