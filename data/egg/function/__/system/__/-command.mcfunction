## Call command.
# Unload.
execute if score @s egg matches -1 run function egg:__/system/__unload

## Call command of sub modules.
function #egg:system/command

## Success.
return 1