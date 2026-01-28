## Verify.
execute unless data storage egg:math/asin_acos <<x~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/asin_acos (2): storage not found (storage egg:math/asin_acos <<x~double)",storage:"egg:math/asin_acos",nbt:"<<x~double"}
execute unless data storage egg:math/asin_acos >>asin~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/asin_acos (3): storage not found (storage egg:math/asin_acos >>asin~double)",storage:"egg:math/asin_acos",nbt:">>asin~double"}
execute unless data storage egg:math/asin_acos >>acos~double run return run function egg:__/error/throw {message:"[ERROR] function egg:math/asin_acos (4): storage not found (storage egg:math/asin_acos >>acos~double)",storage:"egg:math/asin_acos",nbt:">>acos~double"}

## Cast to fixed.
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:math/asin_acos <<x~double
execute store result score #egg:math/fixed/asin_acos|<<x~fixed -- run function egg:__/point/fixed/from_double

## Calculate.
function egg:math/fixed/asin_acos

## Cast to double.
# arcsin
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/asin_acos|>>asin~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/asin_acos >>asin~double set from storage egg:__/point/fixed/to_double >>~double
# arccos
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:math/fixed/asin_acos|>>acos~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:math/asin_acos >>acos~double set from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1
