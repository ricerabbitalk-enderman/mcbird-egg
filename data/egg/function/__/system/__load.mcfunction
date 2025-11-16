## Define scoreboards.
# Command
scoreboard objectives add egg trigger

## Load sub modules.
function #egg:system/load

## Reset trigger.
execute as @a[tag=egg.system] run function egg:__/system/__/-initialize
