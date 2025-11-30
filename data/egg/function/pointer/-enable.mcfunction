## Verify.
execute unless entity @s[type=minecraft:snowball,tag=!egg.pointer] run return run function #egg:error {message:"@s can't initialize as egg.pointer."}

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
