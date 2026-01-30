## Verify.
execute unless data storage egg:shock/give_by_no_one <<.distance run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_by_no_one (2): storage not found (storage egg:shock/give_by_no_one <<.distance)",storage:"egg:shock/give_by_no_one",nbt:"<<.distance"}
execute unless data storage egg:shock/give_by_no_one <<.amount run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/give_by_no_one (3): storage not found (storage egg:shock/give_by_no_one <<.amount)",storage:"egg:shock/give_by_no_one",nbt:"<<.amount"}
execute unless data storage egg:shock/give_by_no_one <<.namespace run data modify storage egg:shock/give_by_no_one <<.namespace set value "minecraft"
execute unless data storage egg:shock/give_by_no_one <<.type run data modify storage egg:shock/give_by_no_one <<.type set value "generic"
execute unless data storage egg:shock/give_by_no_one <<.scale run data modify storage egg:shock/give_by_no_one <<.scale set value 1.0
execute unless data storage egg:shock/give_by_no_one <<.xv run data modify storage egg:shock/give_by_no_one <<.xv set value 0.0
execute unless data storage egg:shock/give_by_no_one <<.yv run data modify storage egg:shock/give_by_no_one <<.yv set value 0.0
execute unless data storage egg:shock/give_by_no_one <<.zv run data modify storage egg:shock/give_by_no_one <<.zv set value 0.0

## Unpack.
execute if data storage egg:pack/call << run data modify storage egg:shock/give_by_no_one << set from storage egg:pack/call <<

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_by_no_one <<
execute summon minecraft:snowball \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_target_to_anyone \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_by_no_one \
    run return run function egg:shock/__/-delete

return fail