## Verify.
execute unless entity @s[type=minecraft:block_display] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-delete (2): entity denied (expected type=minecraft:block_display)",selector:"@s"}
execute unless entity @s[tag=egg.model] run return run function egg:__/error/throw {message:"[ERROR] function egg:model/-delete (3): entity denied (expected tag=egg.model)",entity:"@s",nbt:"Tags"}

## Kill.
execute on passengers run function egg:model/-delete
kill @s

## Success.
return 1