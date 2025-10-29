## Enable features of users.
execute as @a[tag=!egg.system] run function egg:-/system/-/-enable
## Update features of users.
execute as @a[tag=egg.system] at @s unless function egg:-/system/-/-update run function egg:-/system/-/-disable

## Update sub modules.
function #egg:system/tick

## Revoke advancement trigger.
advancement revoke @a only egg:device
