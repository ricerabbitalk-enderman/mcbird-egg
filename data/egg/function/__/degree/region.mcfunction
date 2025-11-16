## Get region (defined like quadrant).
# score <<degree~fixed  <<| Limited degrees (0 <= θ < 360) ~fixed
# return                >>| Region

## Region (defined like quadrand).
# Region is a unique concept.
# It is defined as a quadrant containing an axis.
# 1 = 1st region = 1st quadrant (0   < θ < 90)  and θ = 0
# 2 = 2nd region = 2nd quadrant (90  < θ < 180) and θ = 90
# 3 = 3rd region = 3rd quadrant (180 < θ < 270) and θ = 180
# 4 = 4th region = 4th quadrant (270 < θ < 360) and θ = 270

## Supported 0 <= θ < 360.
execute if score #egg:__/degree/region|<<degree~fixed -- < #egg|0~fixed -- run return fail
execute if score #egg|360~fixed -- <= #egg:__/degree/region|<<degree~fixed -- run return fail

## Get region.
scoreboard players operation #egg:__/degree/region|region -- = #egg:__/degree/region|<<degree~fixed --
scoreboard players operation #egg:__/degree/region|region -- /= #egg|90~fixed --
return run scoreboard players add #egg:__/degree/region|region -- 1
