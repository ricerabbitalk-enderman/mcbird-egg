## Verify.
execute unless data storage egg:nog/scale_motion <<motion run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/scale_motion (2): storage not found (storage egg:nog/scale_motion <<motion)",storage:"egg:nog/scale_motion",nbt:"<<motion"}
execute unless data storage egg:nog/scale_motion <<scale run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/scale_motion (3): storage not found (storage egg:nog/scale_motion <<scale)",storage:"egg:nog/scale_motion",nbt:"<<scale"}
execute unless data storage egg:nog/scale_motion >>motion run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/scale_motion (4): storage not found (storage egg:nog/scale_motion >>motion)",storage:"egg:nog/scale_motion",nbt:">>motion"}

## Fixed from double.
# x
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:nog/scale_motion <<motion[0]
execute store result score #egg:nog/scale_motion|x~fixed -- run function egg:__/point/fixed/from_double
# y
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:nog/scale_motion <<motion[1]
execute store result score #egg:nog/scale_motion|y~fixed -- run function egg:__/point/fixed/from_double
# z
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:nog/scale_motion <<motion[2]
execute store result score #egg:nog/scale_motion|z~fixed -- run function egg:__/point/fixed/from_double
# scale
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:nog/scale_motion <<scale
execute store result score #egg:nog/scale_motion|scale~fixed -- run function egg:__/point/fixed/from_double

## Scale.
# x
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:nog/scale_motion|x~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:nog/scale_motion|scale~fixed --
execute store result score #egg:nog/scale_motion|>>x~fixed -- run function egg:__/operation/multiply
# y
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:nog/scale_motion|y~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:nog/scale_motion|scale~fixed --
execute store result score #egg:nog/scale_motion|>>y~fixed -- run function egg:__/operation/multiply
# z
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:nog/scale_motion|z~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:nog/scale_motion|scale~fixed --
execute store result score #egg:nog/scale_motion|>>z~fixed -- run function egg:__/operation/multiply

## Fixed to double.
data modify storage egg:nog/scale_motion >>motion set value []
# x
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:nog/scale_motion|>>x~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:nog/scale_motion >>motion append from storage egg:__/point/fixed/to_double >>~double
# y
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:nog/scale_motion|>>y~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:nog/scale_motion >>motion append from storage egg:__/point/fixed/to_double >>~double
# z
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:nog/scale_motion|>>z~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:nog/scale_motion >>motion append from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1