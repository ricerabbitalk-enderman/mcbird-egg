## Get arcsin and arccos values.
# score <<x~fixed     <<| Trigonometric value x ~fixed
# score >>asin~fixed  >>| Arcsin degrees value ~fixed
# score >>acos~fixed  >>| Arccos degrees value ~fixed
# return              >>| Success

## Correct x.
execute if score #egg:math/fixed/asin_acos|<<x~fixed -- > #egg|1~fixed -- run scoreboard players operation #egg:math/fixed/asin_acos|<<x~fixed -- = #egg|1~fixed --
execute if score #egg:math/fixed/asin_acos|<<x~fixed -- < #egg|-1~fixed -- run scoreboard players operation #egg:math/fixed/asin_acos|<<x~fixed -- = #egg|-1~fixed --

## Call.
scoreboard players operation #egg:__/math/asin_acos|<<x~fixed -- = #egg:math/fixed/asin_acos|<<x~fixed --
function egg:__/math/asin_acos

## Convert to degrees.
# asin
scoreboard players operation #egg:__/degree/from_radian|<<radian~fixed -- = #egg:__/math/asin_acos|>>asin~fixed --
execute store result score #egg:math/fixed/asin_acos|>>asin~fixed -- run function egg:__/degree/from_radian
# acos
scoreboard players operation #egg:__/degree/from_radian|<<radian~fixed -- = #egg:__/math/asin_acos|>>acos~fixed --
execute store result score #egg:math/fixed/asin_acos|>>acos~fixed -- run function egg:__/degree/from_radian

## Success.
return 1
