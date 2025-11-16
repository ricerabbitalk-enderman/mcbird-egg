## disable features of all players
execute as @a[tag=egg.input] run function egg:input/__/-disable

## Undefine scoreboards.
# Current state
scoreboard objectives remove egg.input.+0
# Previous state
scoreboard objectives remove egg.input.-1
