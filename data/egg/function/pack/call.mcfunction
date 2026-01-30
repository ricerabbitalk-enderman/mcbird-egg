## Verify.
execute unless data storage egg:pack/call <<pack run return run function egg:__/error/throw {message:"[ERROR] function egg:pack/call (2): storage not found (storage egg:pack/call <<pack)",storage:"egg:pack/call",nbt:"<<pack"}

## Set parameter.
data modify storage egg:pack/call << set from storage egg:pack/call <<pack.data

## Call alias.
execute if data storage egg:pack/call <<pack.alias run function egg:pack/__/macro/call_alias with storage egg:pack/call <<pack
## Call name.
execute if data storage egg:pack/call <<pack.name run function egg:pack/__/macro/path_from_name with storage egg:pack/call <<pack

## Get path count.
execute store result score #egg:pack/call|count -- run data get storage egg:pack/__/macro/path_from_name >>path.path
execute if score #egg:pack/call|count -- matches 0 run return fail
execute if score #egg:pack/call|count -- matches 9.. run return fail

## Get parameters.
data modify storage egg:pack/__/macro/call << set value {}
data modify storage egg:pack/__/macro/call <<.namespace set from storage egg:pack/__/macro/path_from_name >>path.namespace
execute if score #egg:pack/call|count -- matches 1.. run data modify storage egg:pack/__/macro/call <<.path_01 set from storage egg:pack/__/macro/path_from_name >>path.path[0]
execute if score #egg:pack/call|count -- matches 2.. run data modify storage egg:pack/__/macro/call <<.path_02 set from storage egg:pack/__/macro/path_from_name >>path.path[1]
execute if score #egg:pack/call|count -- matches 3.. run data modify storage egg:pack/__/macro/call <<.path_03 set from storage egg:pack/__/macro/path_from_name >>path.path[2]
execute if score #egg:pack/call|count -- matches 4.. run data modify storage egg:pack/__/macro/call <<.path_04 set from storage egg:pack/__/macro/path_from_name >>path.path[3]
execute if score #egg:pack/call|count -- matches 5.. run data modify storage egg:pack/__/macro/call <<.path_05 set from storage egg:pack/__/macro/path_from_name >>path.path[4]
execute if score #egg:pack/call|count -- matches 6.. run data modify storage egg:pack/__/macro/call <<.path_06 set from storage egg:pack/__/macro/path_from_name >>path.path[5]
execute if score #egg:pack/call|count -- matches 7.. run data modify storage egg:pack/__/macro/call <<.path_07 set from storage egg:pack/__/macro/path_from_name >>path.path[6]
execute if score #egg:pack/call|count -- matches 8.. run data modify storage egg:pack/__/macro/call <<.path_08 set from storage egg:pack/__/macro/path_from_name >>path.path[7]

## Call with path.
execute if score #egg:pack/call|count -- matches 1 run function egg:pack/__/macro/call_01 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 2 run function egg:pack/__/macro/call_02 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 3 run function egg:pack/__/macro/call_03 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 4 run function egg:pack/__/macro/call_04 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 5 run function egg:pack/__/macro/call_05 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 6 run function egg:pack/__/macro/call_06 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 7 run function egg:pack/__/macro/call_07 with storage egg:pack/__/macro/call <<
execute if score #egg:pack/call|count -- matches 8 run function egg:pack/__/macro/call_08 with storage egg:pack/__/macro/call <<

data remove storage egg:pack/call <<
data remove storage egg:pack/__/macro/call <<

## Success.
return 1