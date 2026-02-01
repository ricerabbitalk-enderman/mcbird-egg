## Damage and knockback by source.
$execute \
  as @e[distance=..$(distance),type=#egg:mob,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
  anchored feet facing entity @s feet positioned ^ ^ ^$(distance) if function egg:shock/__/knockback \
    run damage @s $(amount) $(namespace):$(type) by @e[distance=..$(distance),type=#egg:mob,sort=random,limit=1]

## Success.
return 1