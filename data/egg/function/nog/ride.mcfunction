## Verify.
execute unless data storage egg:nog/ride <<uuid run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/ride (2): storage not found (storage egg:nog/ride <<uuid)",storage:"egg:nog/ride",nbt:"<<uuid"}

## Ride.
data modify storage egg:pointer/-enable <<uuid set from storage egg:nog/ride <<uuid

data modify storage egg:nog/ride position set from entity @s Pos
data modify storage egg:nog/__/ride << set value {}
data modify storage egg:nog/__/ride <<.x set from storage egg:nog/ride position[0]
data modify storage egg:nog/__/ride <<.y set from storage egg:nog/ride position[1]
data modify storage egg:nog/__/ride <<.z set from storage egg:nog/ride position[2]

tag @s add egg.nog.__vehicle
execute at @s summon minecraft:snowball if function egg:pointer/-enable if function egg:nog/__/ride run kill @s
tag @s remove egg.nog.__vehicle

## Success.
return 1