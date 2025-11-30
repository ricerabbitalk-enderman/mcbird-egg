## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_to_others <<
data modify storage egg:pointer/-enable <<uuid set from storage egg:shock/give_to_others <<.source
execute summon minecraft:snowball \
  if function egg:pointer/-enable \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_target_to_others \
  if function egg:shock/__/-set_source_position \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_by_source \
    run return run function egg:shock/__/-delete

## Error.
return run function #egg:error {message:"failed give shock to others."}