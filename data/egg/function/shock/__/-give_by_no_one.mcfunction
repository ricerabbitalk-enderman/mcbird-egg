## Check knockback.
scoreboard players set #egg:shock/__/-give|damage_only -- 0
execute if score #egg:shock|scale~halfixed -- matches 0 if score #egg:shock|xv~halfixed -- matches 0 if score #egg:shock|yv~halfixed -- matches 0 if score #egg:shock|zv~halfixed -- matches 0 \
  run scoreboard players set #egg:shock/__/-give|damage_only -- 1

## Give shock.
execute unless score #egg:shock/__/-give|damage_only -- matches 0 run function egg:shock/__/macro/-give_damage_by_no_one with storage egg:shock <<
execute if score #egg:shock/__/-give|damage_only -- matches 0 run function egg:shock/__/macro/-give_damage_and_knockback_by_no_one with storage egg:shock <<

## Success.
return 1