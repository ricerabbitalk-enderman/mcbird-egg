
## Split `/`.
data modify storage egg:__/path/build >>path set value {path:[]}
data modify storage egg:__/path/__/loop_to_split buffer set from storage egg:__/path/build <<string
function egg:__/path/__/loop_to_split

data modify storage egg:__/string/split <<string set from storage egg:__/path/__/loop_to_split >>rest
function egg:__/string/split_colon

data modify storage egg:__/path/build >>path.namespace set from storage egg:__/string/split >>list[0]
data modify storage egg:__/path/build >>path.path prepend from storage egg:__/string/split >>list[1]

return 1