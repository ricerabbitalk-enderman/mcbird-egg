## Verify.
execute unless data storage egg:shock/give_to_others <<.distance run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_to_others (2): storage not found (storage egg:shock/give_to_others <<.distance)",storage:"egg:shock/give_to_others",nbt:"<<.distance"}
execute unless data storage egg:shock/give_to_others <<.amount run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_to_others (3): storage not found (storage egg:shock/give_to_others <<.amount)",storage:"egg:shock/give_to_others",nbt:"<<.amount"}
execute unless data storage egg:shock/give_to_others <<.namespace run data modify storage egg:shock/give_to_others <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_to_others <<.type run data modify storage egg:shock/give_to_others <<.type set value "generic"
execute unless data storage egg:shock/give_to_others <<.scale run data modify storage egg:shock/give_to_others <<.scale set value 1.0
execute unless data storage egg:shock/give_to_others <<.xv run data modify storage egg:shock/give_to_others <<.xv set value 0.0
execute unless data storage egg:shock/give_to_others <<.yv run data modify storage egg:shock/give_to_others <<.yv set value 0.0
execute unless data storage egg:shock/give_to_others <<.zv run data modify storage egg:shock/give_to_others <<.zv set value 0.0

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_others <<
data modify storage egg:pointer/-enable <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_target_to_others \
  if function egg:shock/__/-set_source_position \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_by_source \
    run return run function egg:shock/__/-delete

return fail