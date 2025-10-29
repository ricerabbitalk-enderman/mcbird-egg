## Compare UUIDs.
# storage <<this <<| This entity's UUID
# storage <<that <<| That entity's UUID
# return         >>| This and that are equal 

## Set That.
execute store result score #egg:uuid/equals.that[0] -- run data get storage egg:uuid/equals <<that[0] 1.0
execute store result score #egg:uuid/equals.that[1] -- run data get storage egg:uuid/equals <<that[1] 1.0
execute store result score #egg:uuid/equals.that[2] -- run data get storage egg:uuid/equals <<that[2] 1.0
execute store result score #egg:uuid/equals.that[3] -- run data get storage egg:uuid/equals <<that[3] 1.0
## Set This.
execute store result score #egg:uuid/equals.this[0] -- run data get storage egg:uuid/equals <<this[0] 1.0
execute store result score #egg:uuid/equals.this[1] -- run data get storage egg:uuid/equals <<this[1] 1.0
execute store result score #egg:uuid/equals.this[2] -- run data get storage egg:uuid/equals <<this[2] 1.0
execute store result score #egg:uuid/equals.this[3] -- run data get storage egg:uuid/equals <<this[3] 1.0

## Equals.
execute \
  if score #egg:uuid/equals.this[0] -- = #egg:uuid/equals.that[0] -- \
  if score #egg:uuid/equals.this[1] -- = #egg:uuid/equals.that[1] -- \
  if score #egg:uuid/equals.this[2] -- = #egg:uuid/equals.that[2] -- \
  if score #egg:uuid/equals.this[3] -- = #egg:uuid/equals.that[3] -- \
    run return 1

## Not Equals.
return 0