## Get input state.
execute store result score #chick:enchantment/fireball/-wooden_sword|pressed -- run function egg:input/-pressed

## Invalid.
execute unless score #chick:enchantment/fireball/-wooden_sword|pressed -- matches 5.. run return 1

## Egg.
execute if predicate egg:player/input/invoke at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/egg
## Snowball.
execute at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/snowball

## Success.
return 1