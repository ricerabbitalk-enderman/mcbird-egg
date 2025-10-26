## Cast ~fixed to ~double.
# score <<~fixed     <<| Fixed value
# storage >>~double  >>| Double value

## Cast.
execute store result storage egg:-/point/fixed/to_double >>~double double 0.000244140625 \
  run scoreboard players get #egg:-/point/fixed/to_double|<<~fixed --
## Success.
return 1