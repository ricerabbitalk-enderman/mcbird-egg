## Next.
execute unless function egg:__/string/__/next run return 0

## Compare char and separator.
execute store success score #egg:__/string/__/loop_to_split|success -- \
  run data modify storage egg:__/string/__/loop_to_split char set value "/"

## Continue.
execute unless score #egg:__/string/__/loop_to_split|success -- matches 0 run return run function egg:__/string/__/loop_to_split_slash

## Split.
return run function egg:__/string/__/split
