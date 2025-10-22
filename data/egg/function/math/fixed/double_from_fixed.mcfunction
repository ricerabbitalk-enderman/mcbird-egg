## Fixed to double.
# score <<~fixed     <<| Fixed value
# storage >>~double  >>| Double value

## Cast.
execute store result storage egg:math/fixed/double_from_fixed >>~double double 0.000244140625 \
  run scoreboard players get #egg:math/fixed/double_from_fixed|<<~fixed --
## Success.
return 1