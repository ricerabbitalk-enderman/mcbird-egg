## Unpack.
execute if data storage egg:pack/call << run data modify storage egg:shock/give_to_oppositions << set from storage egg:pack/call <<

## Verify.
execute unless data storage egg:shock/give_to_oppositions <<.distance run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_to_oppositions (2): storage not found (storage egg:shock/give_to_oppositions <<.distance)",storage:"egg:shock/give_to_oppositions",nbt:"<<.distance"}
execute unless data storage egg:shock/give_to_oppositions <<.amount run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_to_oppositions (3): storage not found (storage egg:shock/give_to_oppositions <<.amount)",storage:"egg:shock/give_to_oppositions",nbt:"<<.amount"}
execute unless data storage egg:shock/give_to_oppositions <<.namespace run data modify storage egg:shock/give_to_oppositions <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_to_oppositions <<.type run data modify storage egg:shock/give_to_oppositions <<.type set value "generic"
execute unless data storage egg:shock/give_to_oppositions <<.scale run data modify storage egg:shock/give_to_oppositions <<.scale set value 1.0
execute unless data storage egg:shock/give_to_oppositions <<.xv run data modify storage egg:shock/give_to_oppositions <<.xv set value 0.0
execute unless data storage egg:shock/give_to_oppositions <<.yv run data modify storage egg:shock/give_to_oppositions <<.yv set value 0.0
execute unless data storage egg:shock/give_to_oppositions <<.zv run data modify storage egg:shock/give_to_oppositions <<.zv set value 0.0

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_oppositions <<
data modify storage egg:pointer/-enable <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_target_to_oppositions \
  if function egg:shock/__/-set_source_position \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_by_source \
    run return run function egg:shock/__/-delete

return fail
