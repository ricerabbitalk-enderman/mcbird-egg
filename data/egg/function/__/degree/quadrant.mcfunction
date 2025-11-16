## Get quadrant.
# score <<degree~fixed  <<| Limited degree (0 <= θ < 360) ~fixed
# return                >>| Quadrant

## Quadrant
# 0 = Out of quadrant (θ = 0,90,180,270)
# 1 = 1st quadrant (0   < θ < 90)
# 2 = 2nd quadrant (90  < θ < 180)
# 3 = 3rd quadrant (180 < θ < 270)
# 4 = 4th quadrant (270 < θ < 360)

## Supported 0 <= θ < 360.
execute if score #egg:__/degree/quadrant|<<degree~fixed -- < #egg|0~fixed -- run return fail
execute if score #egg|360~fixed -- <= #egg:__/degree/quadrant|<<degree~fixed -- run return fail

## Get quadrant.
# in Axis
scoreboard players operation #egg:__/degree/quadrant|in_axis~fixed -- = #egg:__/degree/quadrant|<<degree~fixed --
scoreboard players operation #egg:__/degree/quadrant|in_axis~fixed -- %= #egg|90~fixed --
execute if score #egg:__/degree/quadrant|in_axis~fixed -- matches 0 run return 0
# Quadrant
scoreboard players operation #egg:__/degree/quadrant|quadrant -- = #egg:__/degree/quadrant|<<degree~fixed --
scoreboard players operation #egg:__/degree/quadrant|quadrant -- /= #egg|90~fixed --
return run scoreboard players add #egg:__/degree/quadrant|region -- 1
