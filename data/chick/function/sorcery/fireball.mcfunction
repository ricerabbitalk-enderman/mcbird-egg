## Get motion.
data modify storage egg:3d/motion_from_rotation <<rotation set from entity @s Rotation
function egg:3d/motion_from_rotation
data modify storage chick:sorcery/-projectile <<motion set from storage egg:3d/motion_from_rotation >>motion
data modify storage chick:sorcery/-projectile <<owner set from entity @s UUID

## Sound.
playsound minecraft:entity.blaze.shoot player @a

## Throw.
execute positioned ~ ~-0.5 ~ summon minecraft:fireball run function chick:sorcery/-projectile

## Success.
return 1