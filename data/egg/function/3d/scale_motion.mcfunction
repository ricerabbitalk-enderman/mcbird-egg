## Get rotation from motion.
# storage <<motion  <<| Motion data
# storage <<scale   <<| Scale
# storage >>motion  >>| Scaled Motion data

## Fixed from double.
# x
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:3d/scale_motion <<motion[0]
execute store result score #egg:3d/scale_motion|x~fixed -- run function egg:__/point/fixed/from_double
# y
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:3d/scale_motion <<motion[1]
execute store result score #egg:3d/scale_motion|y~fixed -- run function egg:__/point/fixed/from_double
# z
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:3d/scale_motion <<motion[2]
execute store result score #egg:3d/scale_motion|z~fixed -- run function egg:__/point/fixed/from_double
# scale
data modify storage egg:__/point/fixed/from_double <<~double set from storage egg:3d/scale_motion <<scale
execute store result score #egg:3d/scale_motion|scale~fixed -- run function egg:__/point/fixed/from_double

## Scale.
# x
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:3d/scale_motion|x~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:3d/scale_motion|scale~fixed --
execute store result score #egg:3d/scale_motion|>>x~fixed -- run function egg:__/operation/multiply
# y
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:3d/scale_motion|y~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:3d/scale_motion|scale~fixed --
execute store result score #egg:3d/scale_motion|>>y~fixed -- run function egg:__/operation/multiply
# z
scoreboard players operation #egg:__/operation/multiply|<<x~fixed -- = #egg:3d/scale_motion|z~fixed --
scoreboard players operation #egg:__/operation/multiply|<<y~fixed -- = #egg:3d/scale_motion|scale~fixed --
execute store result score #egg:3d/scale_motion|>>z~fixed -- run function egg:__/operation/multiply

## Fixed to double.
data modify storage egg:3d/scale_motion >>motion set value []
# x
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:3d/scale_motion|>>x~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:3d/scale_motion >>motion append from storage egg:__/point/fixed/to_double >>~double
# y
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:3d/scale_motion|>>y~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:3d/scale_motion >>motion append from storage egg:__/point/fixed/to_double >>~double
# z
scoreboard players operation #egg:__/point/fixed/to_double|<<~fixed -- = #egg:3d/scale_motion|>>z~fixed --
function egg:__/point/fixed/to_double
data modify storage egg:3d/scale_motion >>motion append from storage egg:__/point/fixed/to_double >>~double

## Success.
return 1