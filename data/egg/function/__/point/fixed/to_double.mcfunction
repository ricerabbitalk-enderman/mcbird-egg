## Cast ~fixed to ~double.
# score <<~fixed     <<| Fixed value
# storage >>~double  >>| Double value

## Cast.
execute store result storage egg:__/point/fixed/to_double >>~double double 0.000244140625 \
  run scoreboard players get #egg:__/point/fixed/to_double|<<~fixed --
## Success.
return 1