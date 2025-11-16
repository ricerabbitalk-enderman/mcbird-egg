## Aitken's Δ2 process.
# Effective for slow-approaching alternating series.

# Sn - S(n-1)
scoreboard players operation #egg:__/math/accelerate|S(n)-S(n-1)~fixed -- = #egg:__/math/accelerate|<<S(n)~fixed --
scoreboard players operation #egg:__/math/accelerate|S(n)-S(n-1)~fixed -- -= #egg:__/math/accelerate|<<S(n-1)~fixed --
# S(n-1) - S(n-2)
scoreboard players operation #egg:__/math/accelerate|S(n-1)-S(n-2)~fixed -- = #egg:__/math/accelerate|<<S(n-1)~fixed --
scoreboard players operation #egg:__/math/accelerate|S(n-1)-S(n-2)~fixed -- -= #egg:__/math/accelerate|<<S(n-2)~fixed --
# x = (Sn - S(n-1)) - (S(n-1) - S(n-2))
scoreboard players operation #egg:__/math/accelerate|x~fixed -- = #egg:__/math/accelerate|S(n)-S(n-1)~fixed --
scoreboard players operation #egg:__/math/accelerate|x~fixed -- -= #egg:__/math/accelerate|S(n-1)-S(n-2)~fixed --
# 1/x = 1/(Sn - S(n-1)) - (S(n-1) - S(n-2))
scoreboard players operation #egg:__/math/accelerate|1/x~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:__/math/accelerate|1/x~fixed -- /= #egg:__/math/accelerate|x~fixed --
# y = (S(n-1) - S(n-2))^2
scoreboard players operation #egg:__/math/accelerate|y~fixed -- = #egg:__/math/accelerate|S(n-1)-S(n-2)~fixed --
scoreboard players operation #egg:__/math/accelerate|y~fixed -- *= #egg:__/math/accelerate|S(n-1)-S(n-2)~fixed --
scoreboard players operation #egg:__/math/accelerate|y~fixed -- /= #egg|unit~fixed --
# difference = y/x = y * 1/x
scoreboard players operation #egg:__/math/accelerate|difference~fixed -- = #egg:__/math/accelerate|y~fixed --
scoreboard players operation #egg:__/math/accelerate|difference~fixed -- *= #egg:__/math/accelerate|1/x~fixed --
scoreboard players operation #egg:__/math/accelerate|difference~fixed -- /= #egg|unit~fixed --
# return Sn - difference
scoreboard players operation #egg:__/math/accelerate|result~fixed -- = #egg:__/math/accelerate|<<S(n)~fixed --
return run scoreboard players operation #egg:__/math/accelerate|result~fixed -- -= #egg:__/math/accelerate|difference~fixed --
