## Damage by source.
$execute \
  as @e[distance=..$(distance),type=#egg:mob,tag=!egg.shock.source,scores={egg.alignment=$(alignment_min)..$(alignment_max)}] \
    run damage @s $(amount) $(namespace):$(type) by @e[x=$(source_x),y=$(source_y),z=$(source_z),dx=0,dy=0,dz=0,tag=egg.shock.source,limit=1]

## Success.
return 1