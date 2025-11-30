## Give damage.
data modify storage egg:shock << set from storage egg:shock/give_by_no_one <<
execute summon minecraft:snowball \
  if function egg:shock/__/-enable \
  if function egg:shock/__/-set_target_to_anyone \
  if function egg:shock/__/-set_damage_data \
  if function egg:shock/__/-set_knockback_data \
  if function egg:shock/__/-give_by_no_one \
    run return run function egg:shock/__/-delete

## Error.
return run function #egg:error {message:"failed give shock by no one."}