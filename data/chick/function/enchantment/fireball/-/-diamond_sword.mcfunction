## Get input state.
execute store result score #chick:enchantment/fireball/-wooden_sword|pressed -- run function egg:input/-pressed

## Wither skull.
execute if score #chick:enchantment/fireball/-wooden_sword|pressed -- matches 5.. \
  at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/wither_skull

## Success.
return 1