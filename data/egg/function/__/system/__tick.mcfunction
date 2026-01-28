## Enable features of users.
execute as @a[tag=!egg.system] run function egg:__/system/__/-enable
## Update features of users.
execute as @a[tag=egg.system] at @s unless function egg:__/system/__/-update run function egg:__/system/__/-disable

## Update sub modules.
function #egg:system/tick

## Revoke advancement trigger.
advancement revoke @a only egg:device

return 1
