data modify storage egg:__/path/build <<string set from storage egg:pack/call <<pack.name
$execute if data storage egg:pack registry.$(name) run return run data modify storage egg:pack/__/macro/path_from_name >>path set from storage egg:pack registry.$(name)
$execute unless data storage egg:pack registry.$(name) if function egg:__/path/build run data modify storage egg:pack registry.$(name) set from storage egg:__/path/build >>path
data modify storage egg:pack/__/macro/path_from_name >>path set from storage egg:__/path/build >>path

return 1