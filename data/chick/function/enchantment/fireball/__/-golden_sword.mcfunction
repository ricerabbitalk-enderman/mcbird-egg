## Get input state.
execute store result score #chick:enchantment/fireball/-golden_sword|pushed -- run function egg:input/-pushed

## Invalid.
execute unless score #chick:enchantment/fireball/-golden_sword|pushed -- matches 1.. run return 1

## Fullauto shoot delay.
scoreboard players operation #chick:enchantment/fireball/-golden_sword|delay -- = #chick:enchantment/fireball/-golden_sword|pushed --
scoreboard players operation #chick:enchantment/fireball/-golden_sword|delay -- %= #egg|15 --

## Wind charge.
execute if score #chick:enchantment/fireball/-golden_sword|delay -- matches 5 \
  at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/wind_charge

## Success.
return 1