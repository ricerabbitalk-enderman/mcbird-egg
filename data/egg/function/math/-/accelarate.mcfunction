## Aitken's Δ2 process.
# Effective for slow-approaching alternating series.

# Sn - S(n-1)
scoreboard players operation #egg:math/-/accelarate|S(n)-S(n-1)~fixed -- = #egg:math/-/accelarate|<<S(n)~fixed --
scoreboard players operation #egg:math/-/accelarate|S(n)-S(n-1)~fixed -- -= #egg:math/-/accelarate|<<S(n-1)~fixed --
# S(n-1) - S(n-2)
scoreboard players operation #egg:math/-/accelarate|S(n-1)-S(n-2)~fixed -- = #egg:math/-/accelarate|<<S(n-1)~fixed --
scoreboard players operation #egg:math/-/accelarate|S(n-1)-S(n-2)~fixed -- -= #egg:math/-/accelarate|<<S(n-2)~fixed --
# x = (Sn - S(n-1)) - (S(n-1) - S(n-2))
scoreboard players operation #egg:math/-/accelarate|x~fixed -- = #egg:math/-/accelarate|S(n)-S(n-1)~fixed --
scoreboard players operation #egg:math/-/accelarate|x~fixed -- -= #egg:math/-/accelarate|S(n-1)-S(n-2)~fixed --
# 1/x = 1/(Sn - S(n-1)) - (S(n-1) - S(n-2))
scoreboard players operation #egg:math/-/accelarate|1/x~fixed -- = #egg|unit^2~fixed --
scoreboard players operation #egg:math/-/accelarate|1/x~fixed -- /= #egg:math/-/accelarate|x~fixed --
# y = (S(n-1) - S(n-2))^2
scoreboard players operation #egg:math/-/accelarate|y~fixed -- = #egg:math/-/accelarate|S(n-1)-S(n-2)~fixed --
scoreboard players operation #egg:math/-/accelarate|y~fixed -- *= #egg:math/-/accelarate|S(n-1)-S(n-2)~fixed --
scoreboard players operation #egg:math/-/accelarate|y~fixed -- /= #egg|unit~fixed --
# difference = y/x = y * 1/x
scoreboard players operation #egg:math/-/accelarate|difference~fixed -- = #egg:math/-/accelarate|y~fixed --
scoreboard players operation #egg:math/-/accelarate|difference~fixed -- *= #egg:math/-/accelarate|1/x~fixed --
scoreboard players operation #egg:math/-/accelarate|difference~fixed -- /= #egg|unit~fixed --
# return Sn - difference
scoreboard players operation #egg:math/-/accelarate|result~fixed -- = #egg:math/-/accelarate|<<S(n)~fixed --
return run scoreboard players operation #egg:math/-/accelarate|result~fixed -- -= #egg:math/-/accelarate|difference~fixed --
