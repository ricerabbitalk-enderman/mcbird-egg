## Get target x.
data modify storage egg:shock target set from entity @s Pos

## Get knockback data.
execute as @e[type=snowball,sort=nearest,tag=egg.shock,limit=1] if function egg:shock/__/-get_knockback_motion run teleport @s ~ ~ ~ ~ ~

## Set knockback motion.
data modify entity @s Motion set from storage egg:shock knockback

## Success.
return 1