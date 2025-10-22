## Halfixed to double.
# score <<~halfixed  <<| Halfixed value
# storage >>~double  >>| Double value

## Cast.
execute store result storage egg:math/fixed/double_from_halfixed >>~double double 0.015625 \
  run scoreboard players get #egg:math/fixed/double_from_halfixed|<<~halfixed --
## Success.
return 1