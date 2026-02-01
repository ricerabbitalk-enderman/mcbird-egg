## Noop.
execute unless data entity @s SelectedItem.components."minecraft:custom_data".egg run return 0

## Publish ID.
scoreboard players set #egg:input/__/-update|id -- 0
execute store result score #egg:input/__/-update|id -- run function egg:input/-mainhand
execute if score #egg:input/__/-update|id -- matches 0 if function egg:input/__/set_new_item_id run item modify entity @s weapon.mainhand egg:set_id

## Published.
return 1