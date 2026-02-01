## No need to publish.
execute unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".egg run return 0

## Publish ID.
scoreboard players set #egg:input/__/-update|id -- 0
execute store result score #egg:input/__/-update|id -- run function egg:input/-offhand
execute if score #egg:input/__/-update|id -- matches 0 if function egg:input/__/set_new_item_id run item modify entity @s weapon.offhand egg:set_id

## Published.
return 1