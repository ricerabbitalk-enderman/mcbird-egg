execute unless entity @s[tag=egg.error] run return 0

## Release.
execute on passengers run function egg:__/error/release
kill @s

## Success.
return 1