## Verify.
execute unless data storage egg:nog/match_uuid <<target run return run function egg:__/error/throw {message:"[ERROR] function egg:nog/match_uuid (2): storage not found (storage egg:nog/match_uuid <<target)",storage:"egg:nog/match_uuid",nbt:"<<target"}



## Set That.
execute store result score #egg:nog/match_uuid.that[0] -- run data get storage egg:nog/match_uuid <<target[0] 1.0
execute store result score #egg:nog/match_uuid.that[1] -- run data get storage egg:nog/match_uuid <<target[1] 1.0
execute store result score #egg:nog/match_uuid.that[2] -- run data get storage egg:nog/match_uuid <<target[2] 1.0
execute store result score #egg:nog/match_uuid.that[3] -- run data get storage egg:nog/match_uuid <<target[3] 1.0
## Set This.
data modify storage egg:nog/match_uuid uuid set from entity @s UUID
execute store result score #egg:nog/match_uuid.this[0] -- run data get storage egg:nog/match_uuid uuid[0] 1.0
execute store result score #egg:nog/match_uuid.this[1] -- run data get storage egg:nog/match_uuid uuid[1] 1.0
execute store result score #egg:nog/match_uuid.this[2] -- run data get storage egg:nog/match_uuid uuid[2] 1.0
execute store result score #egg:nog/match_uuid.this[3] -- run data get storage egg:nog/match_uuid uuid[3] 1.0

## Matched.
execute \
  if score #egg:nog/match_uuid.this[0] -- = #egg:nog/match_uuid.that[0] -- \
  if score #egg:nog/match_uuid.this[1] -- = #egg:nog/match_uuid.that[1] -- \
  if score #egg:nog/match_uuid.this[2] -- = #egg:nog/match_uuid.that[2] -- \
  if score #egg:nog/match_uuid.this[3] -- = #egg:nog/match_uuid.that[3] -- \
    run return 1

## Unmatched.
return 0