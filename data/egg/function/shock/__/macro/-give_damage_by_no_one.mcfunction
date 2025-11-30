## Damage.
$execute \
  as @e[distance=..$(distance),type=#egg:mob,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
    run damage @s $(amount) $(namespace):$(type)

## Success.
return 1