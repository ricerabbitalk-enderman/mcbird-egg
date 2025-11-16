## Get asin value.
# score <<x~fixed  <<| Trigonometric value x ~fixed
# return           >>| Asin value ~fixed

## x^n
# x
scoreboard players operation #egg:__/math/asin|x~fixed -- = #egg:__/math/asin|<<x~fixed --
# x^2
scoreboard players operation #egg:__/math/asin|x^2~fixed -- = #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^2~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^2~fixed -- /= #egg|unit~fixed --
# x^3
scoreboard players operation #egg:__/math/asin|x^3~fixed -- = #egg:__/math/asin|x^2~fixed --
scoreboard players operation #egg:__/math/asin|x^3~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^3~fixed -- /= #egg|unit~fixed --
# x^4
scoreboard players operation #egg:__/math/asin|x^4~fixed -- = #egg:__/math/asin|x^3~fixed --
scoreboard players operation #egg:__/math/asin|x^4~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^4~fixed -- /= #egg|unit~fixed --
# x^5
scoreboard players operation #egg:__/math/asin|x^5~fixed -- = #egg:__/math/asin|x^4~fixed --
scoreboard players operation #egg:__/math/asin|x^5~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^5~fixed -- /= #egg|unit~fixed --
# x^6
scoreboard players operation #egg:__/math/asin|x^6~fixed -- = #egg:__/math/asin|x^5~fixed --
scoreboard players operation #egg:__/math/asin|x^6~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^6~fixed -- /= #egg|unit~fixed --
# x^7
scoreboard players operation #egg:__/math/asin|x^7~fixed -- = #egg:__/math/asin|x^6~fixed --
scoreboard players operation #egg:__/math/asin|x^7~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^7~fixed -- /= #egg|unit~fixed --
# x^8
scoreboard players operation #egg:__/math/asin|x^8~fixed -- = #egg:__/math/asin|x^7~fixed --
scoreboard players operation #egg:__/math/asin|x^8~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^8~fixed -- /= #egg|unit~fixed --
# x^9
scoreboard players operation #egg:__/math/asin|x^9~fixed -- = #egg:__/math/asin|x^8~fixed --
scoreboard players operation #egg:__/math/asin|x^9~fixed -- *= #egg:__/math/asin|x~fixed --
scoreboard players operation #egg:__/math/asin|x^9~fixed -- /= #egg|unit~fixed --
# x^10
#scoreboard players operation #egg:__/math/asin|x^10~fixed -- = #egg:__/math/asin|x^9~fixed --
#scoreboard players operation #egg:__/math/asin|x^10~fixed -- *= #egg:__/math/asin|x~fixed --
#scoreboard players operation #egg:__/math/asin|x^10~fixed -- /= #egg|unit~fixed --
# x^11
#scoreboard players operation #egg:__/math/asin|x^11~fixed -- = #egg:__/math/asin|x^10~fixed --
#scoreboard players operation #egg:__/math/asin|x^11~fixed -- *= #egg:__/math/asin|x~fixed --
#scoreboard players operation #egg:__/math/asin|x^11~fixed -- /= #egg|unit~fixed --

## Note.
# Since the scoreboard calculations did not yield good accuracy,
# use egg:operation scale to compute the coefficients.

## asin
# asin ≒ x
scoreboard players operation #egg:__/math/asin|>>asin~fixed -- = #egg:__/math/asin|x~fixed --
# x^3*1!!/(2!!*3) (= x^3 * 1!!/(2!!*3))
#scoreboard players operation #egg:__/math/asin|term~fixed -- = #egg:__/math/asin|x^3~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- *= #egg|1!!/(2!!*3)~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.1666666667 run scoreboard players get #egg:__/math/asin|x^3~fixed --
execute store result score #egg:__/math/asin|term~fixed -- run data get storage egg:operation scale
# asin ≒ x + x^3*1!!/(2!!*3)
scoreboard players operation #egg:__/math/asin|>>asin~fixed -- += #egg:__/math/asin|term~fixed --
# x^5*3!!/(4!!*5) = (x^5 * 3!!/(4!!*5))
#scoreboard players operation #egg:__/math/asin|term~fixed -- = #egg:__/math/asin|x^5~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- *= #egg|3!!/(4!!*5)~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.075 run scoreboard players get #egg:__/math/asin|x^5~fixed --
execute store result score #egg:__/math/asin|term~fixed -- run data get storage egg:operation scale
# asin ≒ x + x^3*1!!/(2!!*3) + x^5*3!!/(4!!*5)
scoreboard players operation #egg:__/math/asin|>>asin~fixed -- += #egg:__/math/asin|term~fixed --
# x^7*5!!/(6!!*7) = (x^7 * 5!!/(6!!*7))
#scoreboard players operation #egg:__/math/asin|term~fixed -- = #egg:__/math/asin|x^7~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- *= #egg|5!!/(6!!*7)~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.04464285714 run scoreboard players get #egg:__/math/asin|x^7~fixed --
execute store result score #egg:__/math/asin|term~fixed -- run data get storage egg:operation scale
# asin ≒ x + x^3*1!!/(2!!*3) + x^5*3!!/(4!!*5) + x^7*5!!/(6!!*7)
scoreboard players operation #egg:__/math/asin|>>asin~fixed -- += #egg:__/math/asin|term~fixed --
# x^9*7!!/(8!!*9) = (x^9 * 7!!/(8!!*9))
#scoreboard players operation #egg:__/math/asin|term~fixed -- = #egg:__/math/asin|x^9~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- *= #egg|7!!/(8!!*9)~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- /= #egg|unit~fixed --
execute store result storage egg:operation scale double 0.03038194444 run scoreboard players get #egg:__/math/asin|x^9~fixed --
execute store result score #egg:__/math/asin|term~fixed -- run data get storage egg:operation scale
# asin ≒ x + x^3*1!!/(2!!*3) + x^5*3!!/(4!!*5) + x^9*7!!/(8!!*9)
return run scoreboard players operation #egg:__/math/asin|>>asin~fixed -- += #egg:__/math/asin|term~fixed --
# x^11*9!!/(10!!*11) = (x^11 * 9!!/(10!!*11))
#scoreboard players operation #egg:__/math/asin|term~fixed -- = #egg:__/math/asin|x^11~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- *= #egg|9!!/(10!!*11)~fixed --
#scoreboard players operation #egg:__/math/asin|term~fixed -- /= #egg|unit~fixed --
#execute store result storage egg:operation scale double 0.02237215909 run scoreboard players get #egg:__/math/asin|x^11~fixed --
#execute store result score #egg:__/math/asin|term~fixed -- run data get storage egg:operation scale
# asin ≒ x + x^3*1!!/(2!!*3) + x^5*3!!/(4!!*5) + x^9*7!!/(8!!*9) + x^11*9!!/(10!!*11)
#return run scoreboard players operation #egg:__/math/asin|>>asin~fixed -- += #egg:__/math/asin|term~fixed --
