## @s and target match by UUID.
# storage <<target <<| Target entity's UUID
# return           >>| @s and target match 

## Set That.
execute store result score #egg:uuid/match.that[0] -- run data get storage egg:uuid/match <<target[0] 1.0
execute store result score #egg:uuid/match.that[1] -- run data get storage egg:uuid/match <<target[1] 1.0
execute store result score #egg:uuid/match.that[2] -- run data get storage egg:uuid/match <<target[2] 1.0
execute store result score #egg:uuid/match.that[3] -- run data get storage egg:uuid/match <<target[3] 1.0
## Set This.
data modify storage egg:uuid/match uuid set from entity @s UUID
execute store result score #egg:uuid/match.this[0] -- run data get storage egg:uuid/match uuid[0] 1.0
execute store result score #egg:uuid/match.this[1] -- run data get storage egg:uuid/match uuid[1] 1.0
execute store result score #egg:uuid/match.this[2] -- run data get storage egg:uuid/match uuid[2] 1.0
execute store result score #egg:uuid/match.this[3] -- run data get storage egg:uuid/match uuid[3] 1.0

## Match.
execute \
  if score #egg:uuid/match.this[0] -- = #egg:uuid/match.that[0] -- \
  if score #egg:uuid/match.this[1] -- = #egg:uuid/match.that[1] -- \
  if score #egg:uuid/match.this[2] -- = #egg:uuid/match.that[2] -- \
  if score #egg:uuid/match.this[3] -- = #egg:uuid/match.that[3] -- \
    run return 1

## Unmatched.
return 0