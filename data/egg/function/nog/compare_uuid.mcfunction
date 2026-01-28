## Verify.
execute unless data storage egg:nog/compare_uuid <<this run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/compare_uuid (2): storage not found (storage egg:nog/compare_uuid <<this)",storage:"egg:nog/compare_uuid",nbt:"<<this"}
execute unless data storage egg:nog/compare_uuid <<that run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/compare_uuid (3): storage not found (storage egg:nog/compare_uuid <<that)",storage:"egg:nog/compare_uuid",nbt:"<<that"}



## Set That.
execute store result score #egg:nog/compare_uuid|that[0] -- run data get storage egg:nog/compare_uuid <<that[0] 1.0
execute store result score #egg:nog/compare_uuid|that[1] -- run data get storage egg:nog/compare_uuid <<that[1] 1.0
execute store result score #egg:nog/compare_uuid|that[2] -- run data get storage egg:nog/compare_uuid <<that[2] 1.0
execute store result score #egg:nog/compare_uuid|that[3] -- run data get storage egg:nog/compare_uuid <<that[3] 1.0
## Set This.
execute store result score #egg:nog/compare_uuid|this[0] -- run data get storage egg:nog/compare_uuid <<this[0] 1.0
execute store result score #egg:nog/compare_uuid|this[1] -- run data get storage egg:nog/compare_uuid <<this[1] 1.0
execute store result score #egg:nog/compare_uuid|this[2] -- run data get storage egg:nog/compare_uuid <<this[2] 1.0
execute store result score #egg:nog/compare_uuid|this[3] -- run data get storage egg:nog/compare_uuid <<this[3] 1.0

## equals.
execute \
  if score #egg:nog/compare_uuid|this[0] -- = #egg:nog/compare_uuid|that[0] -- \
  if score #egg:nog/compare_uuid|this[1] -- = #egg:nog/compare_uuid|that[1] -- \
  if score #egg:nog/compare_uuid|this[2] -- = #egg:nog/compare_uuid|that[2] -- \
  if score #egg:nog/compare_uuid|this[3] -- = #egg:nog/compare_uuid|that[3] -- \
    run return 1

## Not equals|
return 0