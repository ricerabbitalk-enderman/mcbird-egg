## Set data.
data modify storage egg:__/string/__/loop_to_split string set string storage egg:__/string/split <<string 0
data modify storage egg:__/string/__/loop_to_split buffer set string storage egg:__/string/split <<string 0

## Set scoreboards.
execute store result score #egg:__/string/__/loop_to_split|count -- run data get storage egg:__/string/__/loop_to_split string
scoreboard players set #egg:__/string/__/loop_to_split|index -- 0

## Loop to split.
data modify storage egg:__/string/split >>list set value []
return run function egg:__/string/__/loop_to_split_slash
