## Get arcsin and arccos values.
# score <<x~fixed     <<| Trigonometric value x ~fixed
# score >>asin~fixed  >>| Asin value ~fixed
# score >>acos~fixed  >>| Acos value ~fixed
# return              >>| Success

## Get sgn.
scoreboard players operation #egg:-/math/sgn|<<x -- = #egg:-/math/asin_acos|<<x~fixed --
execute store result score #egg:-/math/asin_acos|sgn -- run function egg:-/math/sgn

## Get abs(x)
scoreboard players operation #egg:-/math/abs|<<x -- = #egg:-/math/asin_acos|<<x~fixed --
execute store result score #egg:-/math/asin_acos|abs_x~fixed -- run function egg:-/math/abs

## Plain asin.
scoreboard players operation #egg:-/math/asin|<<x~fixed -- = #egg:-/math/asin_acos|abs_x~fixed --
execute \
  if score #egg:-/math/asin|<<x~fixed -- <= #egg|SQRT(1/2)~fixed -- \
  store result score #egg:-/math/asin_acos|>>asin~fixed -- \
    run function egg:-/math/asin

## Optimized asin.
scoreboard players operation #egg:-/math/asin_optimized|<<x~fixed -- = #egg:-/math/asin_acos|abs_x~fixed --
execute \
  if score #egg:-/math/asin_optimized|<<x~fixed -- > #egg|SQRT(1/2)~fixed -- \
  store result score #egg:-/math/asin_acos|>>asin~fixed -- \
    run function egg:-/math/asin_optimized

## asin
scoreboard players operation #egg:-/math/asin_acos|>>asin~fixed -- *= #egg:-/math/asin_acos|sgn --
## acos
scoreboard players operation #egg:-/math/asin_acos|>>acos~fixed -- = #egg|pi/2~fixed --
scoreboard players operation #egg:-/math/asin_acos|>>acos~fixed -- -= #egg:-/math/asin_acos|>>asin~fixed --

## Success.
return 1
