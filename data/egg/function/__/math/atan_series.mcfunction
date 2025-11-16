## Get arctan value by Mcloughlin's series.
# score <<m~fixed  <<| slope value m ~fixed
# return           >>| Atan value ~fixed

## Mcloughlin's series
# The Maclaurin's series is difficult to get high accuracy for large values.

## m^n.
# m
scoreboard players operation #egg:__/math/atan_series|m~fixed -- = #egg:__/math/atan_series|<<m~fixed --
# m^2
scoreboard players operation #egg:__/math/atan_series|m^2~fixed -- = #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^2~fixed -- *= #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^2~fixed -- /= #egg|unit~fixed --
# m^3
scoreboard players operation #egg:__/math/atan_series|m^3~fixed -- = #egg:__/math/atan_series|m^2~fixed --
scoreboard players operation #egg:__/math/atan_series|m^3~fixed -- *= #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^3~fixed -- /= #egg|unit~fixed --
# m^4
scoreboard players operation #egg:__/math/atan_series|m^4~fixed -- = #egg:__/math/atan_series|m^3~fixed --
scoreboard players operation #egg:__/math/atan_series|m^4~fixed -- *= #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^4~fixed -- /= #egg|unit~fixed --
# m^5
scoreboard players operation #egg:__/math/atan_series|m^5~fixed -- = #egg:__/math/atan_series|m^4~fixed --
scoreboard players operation #egg:__/math/atan_series|m^5~fixed -- *= #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^5~fixed -- /= #egg|unit~fixed --
# m^6
scoreboard players operation #egg:__/math/atan_series|m^6~fixed -- = #egg:__/math/atan_series|m^5~fixed --
scoreboard players operation #egg:__/math/atan_series|m^6~fixed -- *= #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^6~fixed -- /= #egg|unit~fixed --
# m^7
scoreboard players operation #egg:__/math/atan_series|m^7~fixed -- = #egg:__/math/atan_series|m^6~fixed --
scoreboard players operation #egg:__/math/atan_series|m^7~fixed -- *= #egg:__/math/atan_series|m~fixed --
scoreboard players operation #egg:__/math/atan_series|m^7~fixed -- /= #egg|unit~fixed --

## Calculate.
# m
scoreboard players operation #egg:__/math/atan_series|atan~fixed -- = #egg:__/math/atan_series|m~fixed --
# m^3/3 = m^3 * 1/3
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- = #egg:__/math/atan_series|m^3~fixed --
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- *= #egg|1/3~fixed --
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.3333333333 run scoreboard players get #egg:__/math/atan|m^3~fixed --
execute store result score #egg:__/math/atan_series|term~fixed -- run data get storage egg:operation scale
# m - m^3/3
scoreboard players operation #egg:__/math/atan_series|atan~fixed -- -= #egg:__/math/atan_series|term~fixed --
scoreboard players operation #egg:__/math/atan_series|S(1)~fixed -- = #egg:__/math/atan_series|atan~fixed --
# m^5/5 = m^5 * 1/5
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- = #egg:__/math/atan_series|m^5~fixed --
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- *= #egg|1/5~fixed --
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.2 run scoreboard players get #egg:__/math/atan|m^5~fixed --
execute store result score #egg:__/math/atan_series|term~fixed -- run data get storage egg:operation scale
# m - m^3/3 + m^5/5
scoreboard players operation #egg:__/math/atan_series|atan~fixed -- += #egg:__/math/atan_series|term~fixed --
scoreboard players operation #egg:__/math/atan_series|S(2)~fixed -- = #egg:__/math/atan_series|atan~fixed --
# m^7/7 = m^7 * 1/7
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- = #egg:__/math/atan_series|m^7~fixed --
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- *= #egg|1/7~fixed --
#scoreboard players operation #egg:__/math/atan_series|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.1428571429 run scoreboard players get #egg:__/math/atan|m^7~fixed --
execute store result score #egg:__/math/atan_series|term~fixed -- run data get storage egg:operation scale
# m - m^3/3 + m^5/5 - m^7/7
scoreboard players operation #egg:__/math/atan_series|atan~fixed -- -= #egg:__/math/atan_series|term~fixed --
scoreboard players operation #egg:__/math/atan_series|S(3)~fixed -- = #egg:__/math/atan_series|atan~fixed --

## Accelarate.
scoreboard players operation #egg:__/math/accelerate|<<S(n-2)~fixed -- = #egg:__/math/atan_series|S(1)~fixed --
scoreboard players operation #egg:__/math/accelerate|<<S(n-1)~fixed -- = #egg:__/math/atan_series|S(2)~fixed --
scoreboard players operation #egg:__/math/accelerate|<<S(n)~fixed -- = #egg:__/math/atan_series|S(3)~fixed --
return run function egg:__/math/accelerate
