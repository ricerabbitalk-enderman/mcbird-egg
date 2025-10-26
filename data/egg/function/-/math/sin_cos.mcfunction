## Get sin and cos values.
# score <<radian~fixed  <<| Radian value
# score >>sin~fixed     >>| Sin value
# score >>cos~fixed     >>| Cos value
# return                >>| Success

## x^n.
# x
scoreboard players operation #egg:-/math/sin_cos|x~fixed -- = #egg:-/math/sin_cos|<<radian~fixed --
# x^2
scoreboard players operation #egg:-/math/sin_cos|x^2~fixed -- = #egg:-/math/sin_cos|x~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^2~fixed -- *= #egg:-/math/sin_cos|x~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^2~fixed -- /= #egg|unit~fixed --
# x^3
scoreboard players operation #egg:-/math/sin_cos|x^3~fixed -- = #egg:-/math/sin_cos|x^2~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^3~fixed -- *= #egg:-/math/sin_cos|x~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^3~fixed -- /= #egg|unit~fixed --
# x^4
scoreboard players operation #egg:-/math/sin_cos|x^4~fixed -- = #egg:-/math/sin_cos|x^3~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^4~fixed -- *= #egg:-/math/sin_cos|x~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^4~fixed -- /= #egg|unit~fixed --
# x^5
scoreboard players operation #egg:-/math/sin_cos|x^5~fixed -- = #egg:-/math/sin_cos|x^4~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^5~fixed -- *= #egg:-/math/sin_cos|x~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^5~fixed -- /= #egg|unit~fixed --
# x^6
scoreboard players operation #egg:-/math/sin_cos|x^6~fixed -- = #egg:-/math/sin_cos|x^5~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^6~fixed -- *= #egg:-/math/sin_cos|x~fixed --
scoreboard players operation #egg:-/math/sin_cos|x^6~fixed -- /= #egg|unit~fixed --

## sin
# sin ≒ x
scoreboard players operation #egg:-/math/sin_cos|>>sin~fixed -- = #egg:-/math/sin_cos|x~fixed --
# x^3/3! (= x^3 * 1/3!)
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- = #egg:-/math/sin_cos|x^3~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- *= #egg|1/3!~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- /= #egg|unit~fixed --
# sin ≒ x - x^3/3!
scoreboard players operation #egg:-/math/sin_cos|>>sin~fixed -- -= #egg:-/math/sin_cos|term~fixed --
# x^5/5! (= x^5 * 1/5!)
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- = #egg:-/math/sin_cos|x^5~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- *= #egg|1/5!~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- /= #egg|unit~fixed --
# sin ≒ x - x^3/3! + x^5/5!
scoreboard players operation #egg:-/math/sin_cos|>>sin~fixed -- += #egg:-/math/sin_cos|term~fixed --

## cos
# cos ≒ 1
scoreboard players operation #egg:-/math/sin_cos|>>cos~fixed -- = #egg|unit~fixed --
# x^2/2! (= x^2 * 1/2!)
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- = #egg:-/math/sin_cos|x^2~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- *= #egg|1/2!~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- /= #egg|unit~fixed --
# cos ≒ x - x^2/2!
scoreboard players operation #egg:-/math/sin_cos|>>cos~fixed -- -= #egg:-/math/sin_cos|term~fixed --
# x^4/4! (= x^4 * 1/4!)
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- = #egg:-/math/sin_cos|x^4~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- *= #egg|1/4!~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- /= #egg|unit~fixed --
# cos ≒ x - x^2/2! + x^4/4!
scoreboard players operation #egg:-/math/sin_cos|>>cos~fixed -- += #egg:-/math/sin_cos|term~fixed --
# x^6/6! (= x^6 * 1/6!)
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- = #egg:-/math/sin_cos|x^6~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- *= #egg|1/6!~fixed --
scoreboard players operation #egg:-/math/sin_cos|term~fixed -- /= #egg|unit~fixed --
# cos ≒ x - x^2/2! + x^4/4! - x^6/6!
scoreboard players operation #egg:-/math/sin_cos|>>cos~fixed -- -= #egg:-/math/sin_cos|term~fixed --

## Success.
return 1
