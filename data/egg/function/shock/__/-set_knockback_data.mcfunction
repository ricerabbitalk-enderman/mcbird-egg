## Get scale.
scoreboard players set #egg:shock|scale~5bit -- 32
execute if data storage egg:shock <<.scale store result score #egg:shock|scale~5bit -- run data get storage egg:shock <<.scale 32

## Get additional motion.
scoreboard players set #egg:shock|xv~5bit -- 0
scoreboard players set #egg:shock|yv~5bit -- 0
scoreboard players set #egg:shock|zv~5bit -- 0
execute if data storage egg:shock <<.xv store result score #egg:shock|xv~5bit -- run data get storage egg:shock <<.xv 32
execute if data storage egg:shock <<.yv store result score #egg:shock|yv~5bit -- run data get storage egg:shock <<.yv 32
execute if data storage egg:shock <<.zv store result score #egg:shock|zv~5bit -- run data get storage egg:shock <<.zv 32

## Get origin position.
data modify storage egg:shock origin set from entity @s Pos

## Success.
return 1
