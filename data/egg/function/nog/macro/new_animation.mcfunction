## Verify.

## New model.
$function #egg:bdengine/$(model)
## Play.
$data modify storage egg:model/-show <<looks set from storage egg:bdengine $(model)
$data modify storage egg:animation/-set << set value {repeat:$(repeat),path:$(model)-$(anime)}
execute as @e[tag=__uninitialized] \
  if function egg:model/-enable \
  if function egg:model/-rotate \
  if function egg:model/-show \
  if function egg:animation/-enable \
  if function egg:animation/-set \
  if function egg:animation/-play \
    run return 1

## Failure.
return 0