## Verify.
execute unless entity @s[type=minecraft:snowball] run return run function egg:__/error/throw {message:"[ERROR] function egg:pointer/-enable (2): entity denied (expected type=minecraft:snowball)",selector:"@s"}
execute if entity @s[tag=egg.pointer] run return run function egg:__/error/throw {message:"[ERROR] function egg:pointer/-enable (3): entity denied (unexpected tag=egg.pointer)",entity:"@s",nbt:"Tags"}

## Set data.
data modify entity @s Invulnerable set value true
data modify entity @s Silent set value true
data modify entity @s NoGravity set value true
data modify entity @s Item set value {id:"minecraft:barrier",count:1,components:{"minecraft:item_model":"minecraft:air"}}
data modify entity @s Owner set from storage egg:pointer/-enable <<uuid
## Add tags.
tag @s add egg.pointer

## Success.
return 1