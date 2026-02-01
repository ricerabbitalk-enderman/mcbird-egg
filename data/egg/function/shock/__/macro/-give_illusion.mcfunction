## Damage by source.
$execute \
  as @e[distance=..$(distance),type=#egg:mob,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
    run damage @s $(amount) $(namespace):$(type) by @e[distance=..$(distance),type=#egg:mob,scores={egg.alignment=$(alignment_min)..$(alignment_max)},sort=random,limit=1]

## Success.
return 1