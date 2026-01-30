## Verify.

## New model.
$function #egg:bdengine/$(model)
## Enable egg.model.
execute as @e[tag=__uninitialized] unless function egg:model/-enable run return 0

## Success.
return 1