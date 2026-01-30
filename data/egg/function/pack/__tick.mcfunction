execute unless data storage egg:pack reserved[-1] run return 0

data modify storage egg:pack/__/macro/path_from_name << set value {}
data modify storage egg:pack/__/macro/path_from_name <<.name set from storage egg:pack reserved[-1]
data remove storage egg:pack reserved[-1]

function egg:pack/__/macro/path_from_name with storage egg:pack/__/macro/path_from_name <<
return 1