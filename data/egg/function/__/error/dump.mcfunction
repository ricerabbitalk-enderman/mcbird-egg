execute unless entity @s[tag=egg.error] run return 0

## Bump info.
tellraw @a ["[INFO]: ",{selector:"@s"}]
tellraw @a ["[INFO]: ",{entity:"@s",nbt:""}]

## Success.
return 1
