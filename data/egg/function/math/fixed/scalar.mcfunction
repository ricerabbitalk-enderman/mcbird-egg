## Get scalar from vector
# score <<x~fixed      <<| Vector x value ~fixed
# score <<y~fixed      <<| Vector y value ~fixed
# score <<z~fixed      <<| Vector z value ~fixed
# score >>unit~adjusted  >>| Unit ~adjusted
# return               <<| Scalar ~adjusted

## Parameters.
scoreboard players operation #egg:math/fixed/scalar|x~fixed -- = #egg:math/fixed/scalar|<<x~fixed --
scoreboard players operation #egg:math/fixed/scalar|y~fixed -- = #egg:math/fixed/scalar|<<y~fixed --
scoreboard players operation #egg:math/fixed/scalar|z~fixed -- = #egg:math/fixed/scalar|<<z~fixed --

## Get unit ~adjusted
scoreboard players operation #egg:math/fixed/-/scalar_unit|<<x~fixed -- = #egg:math/fixed/scalar|x~fixed --
scoreboard players operation #egg:math/fixed/-/scalar_unit|<<y~fixed -- = #egg:math/fixed/scalar|y~fixed --
scoreboard players operation #egg:math/fixed/-/scalar_unit|<<z~fixed -- = #egg:math/fixed/scalar|z~fixed --
execute store result score #egg:math/fixed/scalar|>>unit~adjusted -- run function egg:math/fixed/-/scalar_unit

## edge^2
# x^2
scoreboard players operation #egg:math/fixed/scalar|x^2~adjusted -- = #egg:math/fixed/-/scalar_unit|>>x~adjusted --
scoreboard players operation #egg:math/fixed/scalar|x^2~adjusted -- *= #egg:math/fixed/-/scalar_unit|>>x~adjusted --
scoreboard players operation #egg:math/fixed/scalar|x^2~adjusted -- /= #egg:math/fixed/scalar|>>unit~adjusted --
# y^2
scoreboard players operation #egg:math/fixed/scalar|y^2~adjusted -- = #egg:math/fixed/-/scalar_unit|>>y~adjusted --
scoreboard players operation #egg:math/fixed/scalar|y^2~adjusted -- *= #egg:math/fixed/-/scalar_unit|>>y~adjusted --
scoreboard players operation #egg:math/fixed/scalar|y^2~adjusted -- /= #egg:math/fixed/scalar|>>unit~adjusted --
# z^2
scoreboard players operation #egg:math/fixed/scalar|z^2~adjusted -- = #egg:math/fixed/-/scalar_unit|>>z~adjusted --
scoreboard players operation #egg:math/fixed/scalar|z^2~adjusted -- *= #egg:math/fixed/-/scalar_unit|>>z~adjusted --
scoreboard players operation #egg:math/fixed/scalar|z^2~adjusted -- /= #egg:math/fixed/scalar|>>unit~adjusted --

## √(x^2+y^2+z^2)
scoreboard players operation #egg:math/sqrt|<<x -- = #egg:math/fixed/scalar|x^2~adjusted --
scoreboard players operation #egg:math/sqrt|<<x -- += #egg:math/fixed/scalar|y^2~adjusted --
scoreboard players operation #egg:math/sqrt|<<x -- += #egg:math/fixed/scalar|z^2~adjusted --
scoreboard players operation #egg:math/sqrt|<<x -- *= #egg:math/fixed/scalar|>>unit~adjusted --
return run function egg:math/sqrt
