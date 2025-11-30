teleport @s ~ ~ ~
data modify storage egg:shock limit set from entity @s Pos
execute positioned ^ ^ ^1 run teleport @s ~ ~ ~
data modify storage egg:shock unit set from entity @s Pos

## Get origin.
execute store result score #egg:shock|origin_x~5bit -- run data get storage egg:shock origin[0] 32
#execute store result score #egg:shock|origin_y~5bit -- run data get storage egg:shock origin[1] 32
#execute store result score #egg:shock|origin_z~5bit -- run data get storage egg:shock origin[2] 32

## Get target.
execute store result score #egg:shock|target_x~5bit -- run data get storage egg:shock target[0] 32
#execute store result score #egg:shock|target_y~5bit -- run data get storage egg:shock target[1] 32
#execute store result score #egg:shock|target_z~5bit -- run data get storage egg:shock target[2] 32

## Get limit.
execute store result score #egg:shock|limit_x~5bit -- run data get storage egg:shock limit[0] 32
execute store result score #egg:shock|limit_y~5bit -- run data get storage egg:shock limit[1] 32
execute store result score #egg:shock|limit_z~5bit -- run data get storage egg:shock limit[2] 32

## Get unit.
execute store result score #egg:shock|unit_x~5bit -- run data get storage egg:shock unit[0] 32
execute store result score #egg:shock|unit_y~5bit -- run data get storage egg:shock unit[1] 32
execute store result score #egg:shock|unit_z~5bit -- run data get storage egg:shock unit[2] 32

scoreboard players operation #egg:shock|unit_x~5bit -- -= #egg:shock|limit_x~5bit --
scoreboard players operation #egg:shock|unit_y~5bit -- -= #egg:shock|limit_y~5bit --
scoreboard players operation #egg:shock|unit_z~5bit -- -= #egg:shock|limit_z~5bit --

scoreboard players operation #egg:shock|unit_x~5bit -- *= #egg:shock|scale~5bit --
scoreboard players operation #egg:shock|unit_y~5bit -- *= #egg:shock|scale~5bit --
scoreboard players operation #egg:shock|unit_z~5bit -- *= #egg:shock|scale~5bit --

scoreboard players operation #egg:shock|unit_x~5bit -- /= #egg|2^5 --
scoreboard players operation #egg:shock|unit_y~5bit -- /= #egg|2^5 --
scoreboard players operation #egg:shock|unit_z~5bit -- /= #egg|2^5 --

## Add motion.
scoreboard players operation #egg:shock|unit_x~5bit -- += #egg:shock|xv~5bit --
scoreboard players operation #egg:shock|unit_y~5bit -- += #egg:shock|yv~5bit --
scoreboard players operation #egg:shock|unit_z~5bit -- += #egg:shock|zv~5bit --

## Get rate.
scoreboard players operation #egg:shock|target_length~5bit -- = #egg:shock|target_x~5bit --
scoreboard players operation #egg:shock|target_length~5bit -- -= #egg:shock|origin_x~5bit --
scoreboard players operation #egg:shock|limit_length~5bit -- = #egg:shock|limit_x~5bit --
scoreboard players operation #egg:shock|limit_length~5bit -- -= #egg:shock|origin_x~5bit --
scoreboard players operation #egg:shock|rate~5bit -- = #egg:shock|limit_length~5bit --
scoreboard players operation #egg:shock|rate~5bit -- -= #egg:shock|target_length~5bit --
scoreboard players operation #egg:shock|rate~5bit -- *= #egg|2^5 --
scoreboard players operation #egg:shock|rate~5bit -- /= #egg:shock|limit_length~5bit --

## Get knockback motion.
data modify storage egg:shock knockback set value [0.0001,0.0001,0.0001]
execute store result storage egg:shock knockback[0] double 0.0009765625 run scoreboard players operation #egg:shock|unit_x~5bit -- *= #egg:shock|rate~5bit --
execute store result storage egg:shock knockback[1] double 0.0009765625 run scoreboard players operation #egg:shock|unit_y~5bit -- *= #egg:shock|rate~5bit --
execute store result storage egg:shock knockback[2] double 0.0009765625 run scoreboard players operation #egg:shock|unit_z~5bit -- *= #egg:shock|rate~5bit --

## Success.
return 1