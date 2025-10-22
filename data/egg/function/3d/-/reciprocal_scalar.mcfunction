## Get reciprocal scalar value.
# score <<scalar~adjusted  <<| Scalar value
# score <<unit~adjusted    <<| Unit value
# return                   >>| Reciprocal scalar value


scoreboard players operation #egg:3d/-/reciprocal_scalar|scalar~fixed -- = #egg:3d/-/reciprocal_scalar|<<scalar~adjusted --

execute if score #egg:3d/-/reciprocal_scalar|<<unit~adjusted -- = #egg|unit~halfixed -- run scoreboard players operation #egg:3d/-/reciprocal_scalar|scalar~fixed -- *= #egg|unit~halfixed --

## ~fixed
scoreboard players operation #egg:3d/-/reciprocal_scalar|1/scalar~fixed -- = #egg|unit^2~fixed --
return run scoreboard players operation #egg:3d/-/reciprocal_scalar|1/scalar~fixed -- /= #egg:3d/-/reciprocal_scalar|scalar~fixed --



tellraw @a ["fixed:",{score:{name:"#egg:3d/-/reciprocal_scalar|<<scalar~adjusted",objective:"--"}},",",{score:{name:"#egg:3d/-/reciprocal_scalar|1/scalar~fixed",objective:"--"}}]
execute if score #egg:3d/-/reciprocal_scalar|<<unit~adjusted -- = #egg|unit~fixed -- run return run scoreboard players get #egg:3d/-/reciprocal_scalar|1/scalar~fixed --

## ~halfixed
scoreboard players operation #egg:3d/-/reciprocal_scalar|1/scalar~fixed -- = #egg|2^12 --
scoreboard players operation #egg:3d/-/reciprocal_scalar|1/scalar~fixed -- /= #egg:3d/-/reciprocal_scalar|<<scalar~adjusted --

tellraw @a ["halfixed:",{score:{name:"#egg:3d/-/reciprocal_scalar|<<scalar~adjusted",objective:"--"}},",",{score:{name:"#egg:3d/-/reciprocal_scalar|1/scalar~fixed",objective:"--"}}]
execute if score #egg:3d/-/reciprocal_scalar|<<unit~adjusted -- = #egg|unit~halfixed -- run return run scoreboard players get #egg:3d/-/reciprocal_scalar|1/scalar~fixed --

## Failure
return fail
