execute unless entity @s[tag=egg.error] run return 0

## Release.
execute on passengers run function egg:__/error/release
kill @s[type=!minecraft:player]
tag @s[type=minecraft:player] remove egg.error

## Success.
return 1