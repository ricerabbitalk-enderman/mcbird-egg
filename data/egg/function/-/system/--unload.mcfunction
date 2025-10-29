## disable features of all players
execute as @a[tag=egg.system] run function egg:-/system/-/-disable

## Unload sub modules.
function #egg:system/unload

## Undefine scoreboards
# Command.
scoreboard objectives remove egg
