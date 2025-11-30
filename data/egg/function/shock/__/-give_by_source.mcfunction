## Check knockback.
scoreboard players set #egg:shock/__/-give_by_source|damage_only -- 0
execute if score #egg:shock|scale~halfixed -- matches 0 if score #egg:shock|xv~halfixed -- matches 0 if score #egg:shock|yv~halfixed -- matches 0 if score #egg:shock|zv~halfixed -- matches 0 \
  run scoreboard players set #egg:shock/__/-give_by_source|damage_only -- 1

## Give shock.
execute on origin run tag @s add egg.shock.source
execute unless score #egg:shock/__/-give_by_source|damage_only -- matches 0 run function egg:shock/__/macro/-give_damage_by_source with storage egg:shock <<
execute if score #egg:shock/__/-give_by_source|damage_only -- matches 0 run function egg:shock/__/macro/-give_damage_and_knockback_by_source with storage egg:shock <<
execute on origin run tag @s remove egg.shock.source

## Success.
return 1