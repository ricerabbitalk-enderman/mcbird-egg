## Aitken's Δ2 process.
# Effective for slow-approaching alternating series.

# Sn - S(n-1)
scoreboard players operation #egg:-/math/accelerate|S(n)-S(n-1)~fixed -- = #egg:-/math/accelerate|<<S(n)~fixed --
scoreboard players operation #egg:-/math/accelerate|S(n)-S(n-1)~fixed -- -= #egg:-/math/accelerate|<<S(n-1)~fixed --
# S(n-1) - S(n-2)
scoreboard players operation #egg:-/math/accelerate|S(n-1)-S(n-2)~fixed -- = #egg:-/math/accelerate|<<S(n-1)~fixed --
scoreboard players operation #egg:-/math/accelerate|S(n-1)-S(n-2)~fixed -- -= #egg:-/math/accelerate|<<S(n-2)~fixed --
# x = (Sn - S(n-1)) - (S(n-1) - S(n-2))
scoreboard players operation #egg:-/math/accelerate|x~fixed -- = #egg:-/math/accelerate|S(n)-S(n-1)~fixed --
scoreboard players operation #egg:-/math/accelerate|x~fixed -- -= #egg:-/math/accelerate|S(n-1)-S(n-2)~fixed --
# 1/x = 1/(Sn - S(n-1)) - (S(n-1) - S(n-2))
scoreboard players operation #egg:-/math/accelerate|1/x~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/accelerate|1/x~fixed -- /= #egg:-/math/accelerate|x~fixed --
# y = (S(n-1) - S(n-2))^2
scoreboard players operation #egg:-/math/accelerate|y~fixed -- = #egg:-/math/accelerate|S(n-1)-S(n-2)~fixed --
scoreboard players operation #egg:-/math/accelerate|y~fixed -- *= #egg:-/math/accelerate|S(n-1)-S(n-2)~fixed --
scoreboard players operation #egg:-/math/accelerate|y~fixed -- /= #egg|unit~fixed --
# difference = y/x = y * 1/x
scoreboard players operation #egg:-/math/accelerate|difference~fixed -- = #egg:-/math/accelerate|y~fixed --
scoreboard players operation #egg:-/math/accelerate|difference~fixed -- *= #egg:-/math/accelerate|1/x~fixed --
scoreboard players operation #egg:-/math/accelerate|difference~fixed -- /= #egg|unit~fixed --
# return Sn - difference
scoreboard players operation #egg:-/math/accelerate|result~fixed -- = #egg:-/math/accelerate|<<S(n)~fixed --
return run scoreboard players operation #egg:-/math/accelerate|result~fixed -- -= #egg:-/math/accelerate|difference~fixed --
