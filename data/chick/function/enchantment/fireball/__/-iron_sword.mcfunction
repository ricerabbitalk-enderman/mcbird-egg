## Get input state.
execute store result score #chick:enchantment/fireball/-iron_sword|pressed -- run function egg:input/-pressed
execute store result score #chick:enchantment/fireball/-iron_sword|pushed -- run function egg:input/-pushed
execute store result score #chick:enchantment/fireball/-iron_sword|released -- run function egg:input/-released

## Fireball.
execute \
  if score #chick:enchantment/fireball/-iron_sword|pressed -- matches 5.. \
    at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/fireball

## Charging performance.
execute if score #chick:enchantment/fireball/-iron_sword|pushed -- matches 5 \
    at @s run playsound minecraft:block.portal.trigger player @a ~ ~ ~ 2 2.0
execute if score #chick:enchantment/fireball/-iron_sword|pushed -- matches 5.. \
    at @s run particle minecraft:portal ~ ~0.9 ~ 0.5 0.5 0.5 0.075 1
## Charged performance.
execute if score #chick:enchantment/fireball/-iron_sword|pushed -- matches 40 \
    at @s run playsound minecraft:entity.ender_dragon.flap player @a ~ ~ ~ 0.75 2.0
execute if score #chick:enchantment/fireball/-iron_sword|pushed -- matches 40..45 \
    at @s run particle minecraft:dragon_breath ~ ~0.9 ~ 0.35 0.35 0.35 0.85 32

## Dragon fireball.
execute \
  if score #chick:enchantment/fireball/-iron_sword|released -- matches 20.. \
    at @s positioned ~ ~1.62 ~ run return run function chick:sorcery/dragon_fireball

## Success.
return 1