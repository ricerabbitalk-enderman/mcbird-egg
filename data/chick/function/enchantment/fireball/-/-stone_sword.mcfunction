## Get input state.
execute store result score #chick:enchantment/fireball/-stone_sword|pushed -- run function egg:input/-pushed

## Invalid.
execute unless score #chick:enchantment/fireball/-stone_sword|pushed -- matches 1.. run return 1

## Fullauto shoot delay.
scoreboard players operation #chick:enchantment/fireball/-stone_sword|delay -- = #chick:enchantment/fireball/-stone_sword|pushed --
scoreboard players operation #chick:enchantment/fireball/-stone_sword|delay -- %= #egg|10 --

## Small fireball.
execute if score #chick:enchantment/fireball/-stone_sword|delay -- matches 0 \
  at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/small_fireball

## Success.
return 1