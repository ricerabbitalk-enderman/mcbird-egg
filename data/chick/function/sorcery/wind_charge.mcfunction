## Get motion.
data modify storage egg:3d/motion_from_rotation <<rotation set from entity @s Rotation
function egg:3d/motion_from_rotation
data modify storage chick:sorcery/-projectile <<motion set from storage egg:3d/motion_from_rotation >>motion
data modify storage chick:sorcery/-projectile <<owner set from entity @s UUID

## Sound.
playsound minecraft:entity.breeze.shoot player @a

## Throw.
execute positioned ~ ~-0.15625 ~ summon minecraft:wind_charge run function chick:sorcery/-projectile

## Success.
return 1