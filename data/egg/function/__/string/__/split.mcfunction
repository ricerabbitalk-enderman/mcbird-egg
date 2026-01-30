## Split.
data modify storage egg:__/string/__/macro/split range set value {begin:0}
execute store result storage egg:__/string/__/macro/split range.end int 1 run scoreboard players get #egg:__/string/__/loop_to_split|index --
data modify storage egg:__/string/__/macro/split <<string set string storage egg:__/string/__/loop_to_split string
function egg:__/string/__/macro/split with storage egg:__/string/__/macro/split range
## Add result.
data modify storage egg:__/string/split >>list append from storage egg:__/string/__/macro/split >>string

## Add empty string.
execute if score #egg:__/string/__/loop_to_split|index -- matches 0 run return run data modify storage egg:__/string/split >>list append value ""

## Correct index.
scoreboard players add #egg:__/string/__/loop_to_split|index -- 1
## Split.
data modify storage egg:__/string/__/macro/split range set value {}
execute store result storage egg:__/string/__/macro/split range.begin int 1 run scoreboard players get #egg:__/string/__/loop_to_split|index --
execute store result storage egg:__/string/__/macro/split range.end int 1 run scoreboard players get #egg:__/string/__/loop_to_split|count --
data modify storage egg:__/string/__/macro/split <<string set string storage egg:__/string/__/loop_to_split string
function egg:__/string/__/macro/split with storage egg:__/string/__/macro/split range
## Add result.
data modify storage egg:__/string/split >>list append from storage egg:__/string/__/macro/split >>string

return 1