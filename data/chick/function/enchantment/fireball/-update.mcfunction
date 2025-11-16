## Inactive.
execute unless function chick:system/running run return 1

## Hold no devices.
execute unless predicate chick:hold/device run return 1

## Call.
execute if items entity @s weapon.mainhand wooden_sword run function chick:enchantment/fireball/__/-wooden_sword
execute if items entity @s weapon.mainhand stone_sword run function chick:enchantment/fireball/__/-stone_sword
execute if items entity @s weapon.mainhand iron_sword run function chick:enchantment/fireball/__/-iron_sword
execute if items entity @s weapon.mainhand golden_sword run function chick:enchantment/fireball/__/-golden_sword
execute if items entity @s weapon.mainhand diamond_sword run function chick:enchantment/fireball/__/-diamond_sword
execute if items entity @s weapon.mainhand netherite_sword run function chick:enchantment/fireball/__/-netherite_sword

## Success.
return 1