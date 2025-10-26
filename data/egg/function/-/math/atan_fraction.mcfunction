## Get arctan value by Gauss's continued fraction.
# score <<m~fixed  <<| slope value m ~fixed
# return           >>| Atan value ~fixed

## Gauss's continued fraction
# Gauss's continued fractions are an algorithm that maintains precision even with large values close to 1.

## m^n
# m
scoreboard players operation #egg:-/math/atan_fraction|m~fixed -- = #egg:-/math/atan_fraction|<<m~fixed --
# m^2
scoreboard players operation #egg:-/math/atan_fraction|m^2~fixed -- = #egg:-/math/atan_fraction|m~fixed --
scoreboard players operation #egg:-/math/atan_fraction|m^2~fixed -- *= #egg:-/math/atan_fraction|m~fixed --
scoreboard players operation #egg:-/math/atan_fraction|m^2~fixed -- /= #egg|unit~fixed --

## term-06
# m^2
scoreboard players operation #egg:-/math/atan_fraction|term-07~fixed -- = #egg:-/math/atan_fraction|m^2~fixed --
# m^2 * 6^2/11
scoreboard players operation #egg:-/math/atan_fraction|term-06~fixed -- = #egg:-/math/atan_fraction|term-07~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-06~fixed -- *= #egg|6^2/11~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-06~fixed -- /= #egg|unit~fixed --
# 11 + m^2 * 6^2/11
scoreboard players operation egg:fixed/math/-/atan_gauss|term-06~fixed -- += #egg|11~fixed --

## term-05
# 1/term-06
scoreboard players operation #egg:-/math/atan_fraction|1/term-06~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/atan_fraction|1/term-06~fixed -- /= #egg:-/math/atan_fraction|term-06~fixed --
# m^2/term-06 = m^2 * 1/term-06
scoreboard players operation #egg:-/math/atan_fraction|term-05~fixed -- = #egg:-/math/atan_fraction|m^2~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-05~fixed -- *= #egg:-/math/atan_fraction|1/term-06~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-05~fixed -- /= #egg|unit~fixed --
# 5^2 * m^2/term-06
scoreboard players operation #egg:-/math/atan_fraction|term-05~fixed -- *= #egg|5^2 --
# 9 + 2^2 * m^2/term-06
scoreboard players operation #egg:-/math/atan_fraction|term-05~fixed -- += #egg|9~fixed --

## term-04
# 1/term-05
scoreboard players operation #egg:-/math/atan_fraction|1/term-05~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/atan_fraction|1/term-05~fixed -- /= #egg:-/math/atan_fraction|term-05~fixed --
# m^2/term-05 = m^2 * 1/term-05
scoreboard players operation #egg:-/math/atan_fraction|term-04~fixed -- = #egg:-/math/atan_fraction|m^2~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-04~fixed -- *= #egg:-/math/atan_fraction|1/term-05~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-04~fixed -- /= #egg|unit~fixed --
# 4^2 * m^2/term-05
scoreboard players operation #egg:-/math/atan_fraction|term-04~fixed -- *= #egg|4^2 --
# 7 + 2^2 * m^2/term-05
scoreboard players operation #egg:-/math/atan_fraction|term-04~fixed -- += #egg|7~fixed --


## term-03
# 1/term-04
scoreboard players operation #egg:-/math/atan_fraction|1/term-04~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/atan_fraction|1/term-04~fixed -- /= #egg:-/math/atan_fraction|term-04~fixed --
# m^2/term-04 = m^2 * 1/term-04
scoreboard players operation #egg:-/math/atan_fraction|term-03~fixed -- = #egg:-/math/atan_fraction|m^2~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-03~fixed -- *= #egg:-/math/atan_fraction|1/term-04~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-03~fixed -- /= #egg|unit~fixed --
# 3^2 * m^2/term-04
scoreboard players operation #egg:-/math/atan_fraction|term-03~fixed -- *= #egg|3^2 --
# 5 + 2^2 * m^2/term-04
scoreboard players operation #egg:-/math/atan_fraction|term-03~fixed -- += #egg|5~fixed --

## term-02
# 1/term-03
scoreboard players operation #egg:-/math/atan_fraction|1/term-03~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/atan_fraction|1/term-03~fixed -- /= #egg:-/math/atan_fraction|term-03~fixed --
# m^2/term-03 = m^2 * 1/term-03
scoreboard players operation #egg:-/math/atan_fraction|term-02~fixed -- = #egg:-/math/atan_fraction|m^2~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-02~fixed -- *= #egg:-/math/atan_fraction|1/term-03~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-02~fixed -- /= #egg|unit~fixed --
# 2^2 * m^2/term-03
scoreboard players operation #egg:-/math/atan_fraction|term-02~fixed -- *= #egg|2^2 --
# 3 + 2^2 * m^2/term-03
scoreboard players operation #egg:-/math/atan_fraction|term-02~fixed -- += #egg|3~fixed --

## term-01
# 1/term-02
scoreboard players operation #egg:-/math/atan_fraction|1/term-02~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/atan_fraction|1/term-02~fixed -- /= #egg:-/math/atan_fraction|term-02~fixed --
# m^2/term-02 = m^2 * 1/term-02
scoreboard players operation #egg:-/math/atan_fraction|term-01~fixed -- = #egg:-/math/atan_fraction|m^2~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-01~fixed -- *= #egg:-/math/atan_fraction|1/term-02~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term-01~fixed -- /= #egg|unit~fixed --
# 1 + m^2/term-02
scoreboard players operation #egg:-/math/atan_fraction|term-01~fixed -- += #egg|1~fixed --

## term
# 1/term-01
scoreboard players operation #egg:-/math/atan_fraction|1/term-01~fixed -- = #egg|double~fixed --
scoreboard players operation #egg:-/math/atan_fraction|1/term-01~fixed -- /= #egg:-/math/atan_fraction|term-01~fixed --
# m/term-01 = m * 1/term-01
scoreboard players operation #egg:-/math/atan_fraction|term~fixed -- = #egg:-/math/atan_fraction|m~fixed --
scoreboard players operation #egg:-/math/atan_fraction|term~fixed -- *= #egg:-/math/atan_fraction|1/term-01~fixed --
return run scoreboard players operation #egg:-/math/atan_fraction|term~fixed -- /= #egg|unit~fixed --
