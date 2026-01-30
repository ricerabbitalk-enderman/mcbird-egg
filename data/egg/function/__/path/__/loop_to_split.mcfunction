## Split "/".
data modify storage egg:__/string/split <<string set string storage egg:__/path/__/loop_to_split buffer
execute unless function egg:__/string/split_slash run return run data modify storage egg:__/path/__/loop_to_split >>rest set from storage egg:__/path/__/loop_to_split buffer

## Add path.
data modify storage egg:__/path/build >>path.path prepend from storage egg:__/string/split >>list[1]
## Set next buffer.
data modify storage egg:__/path/__/loop_to_split buffer set string storage egg:__/string/split >>list[0]

## Recursive call.
return run function egg:__/path/__/loop_to_split