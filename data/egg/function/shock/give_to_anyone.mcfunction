## Verify.
execute unless data storage egg:shock/give_to_anyone <<.distance run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_to_anyone (2): storage not found (storage egg:shock/give_to_anyone <<.distance)",storage:"egg:shock/give_to_anyone",nbt:"<<.distance"}
execute unless data storage egg:shock/give_to_anyone <<.amount run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_to_anyone (3): storage not found (storage egg:shock/give_to_anyone <<.amount)",storage:"egg:shock/give_to_anyone",nbt:"<<.amount"}
execute unless data storage egg:shock/give_to_anyone <<.namespace run data modify storage egg:shock/give_to_anyone <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_to_anyone <<.type run data modify storage egg:shock/give_to_anyone <<.type set value "generic"
execute unless data storage egg:shock/give_to_anyone <<.scale run data modify storage egg:shock/give_to_anyone <<.scale set value 1.0
execute unless data storage egg:shock/give_to_anyone <<.xv run data modify storage egg:shock/give_to_anyone <<.xv set value 0.0
execute unless data storage egg:shock/give_to_anyone <<.yv run data modify storage egg:shock/give_to_anyone <<.yv set value 0.0
execute unless data storage egg:shock/give_to_anyone <<.zv run data modify storage egg:shock/give_to_anyone <<.zv set value 0.0

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_anyone <<
data modify storage egg:pointer/-enable <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_target_to_anyone \
  if function egg:shock/__/-set_source_position \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_by_source \
    run return run function egg:shock/__/-delete

return fail