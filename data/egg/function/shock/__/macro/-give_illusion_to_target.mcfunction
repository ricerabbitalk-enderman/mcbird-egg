## Damage by source.
$execute \
  as @e[distance=..$(distance),type=#egg:mob,tag=egg.shock.target] \
    run damage @s $(amount) $(namespace):$(type) by @e[distance=..$(distance),type=#egg:mob,tag=!egg.shock.source,sort=random,limit=1]

## Success.
return 1