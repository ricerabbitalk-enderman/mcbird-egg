## Unpack.
execute if data storage egg:pack/call << run data modify storage egg:shock/give_to_target << set from storage egg:pack/call <<

## Verify.
execute unless data storage egg:shock/_give_to_target <<.distance run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/_give_to_target (5): storage not found (storage egg:shock/_give_to_target <<.distance)",storage:"egg:shock/_give_to_target",nbt:"<<.distance"}
execute unless data storage egg:shock/_give_to_target <<.amount run return run function egg:__/error/throw {message:"[ERROR] function egg:shock/_give_to_target (6): storage not found (storage egg:shock/_give_to_target <<.amount)",storage:"egg:shock/_give_to_target",nbt:"<<.amount"}
execute unless data storage egg:shock/_give_to_target <<.namespace run data modify storage egg:shock/_give_to_target <<.namespace set value "minecraft"
execute unless data storage egg:shock/_give_to_target <<.type run data modify storage egg:shock/_give_to_target <<.type set value "generic"
execute unless data storage egg:shock/_give_to_target <<.scale run data modify storage egg:shock/_give_to_target <<.scale set value 1.0
execute unless data storage egg:shock/_give_to_target <<.xv run data modify storage egg:shock/_give_to_target <<.xv set value 0.0
execute unless data storage egg:shock/_give_to_target <<.yv run data modify storage egg:shock/_give_to_target <<.yv set value 0.0
execute unless data storage egg:shock/_give_to_target <<.zv run data modify storage egg:shock/_give_to_target <<.zv set value 0.0

## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_target <<
data modify storage egg:pointer/-enable <<uuid set from storage egg:shock <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_source_position \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_to_target \
    run return run function egg:shock/__/-delete

return fail