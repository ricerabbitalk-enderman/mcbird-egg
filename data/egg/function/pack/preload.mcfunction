## Verify.
execute unless data storage egg:pack/preload <<name run return run function egg:__/error/throw {message:"[ERROR] function egg:pack/preload (2): storage not found (storage egg:pack/preload <<name)",storage:"egg:pack/preload",nbt:"<<name"}

#document en
# @storage <<name Function name
# @return Succeeded or not
# @description Pre-registers the function name.
# The `egg:pack` package requires significant parsing when aliases aren't specified, often causing heavy initial load.
# Pre-registering with this function performs parsing in the background.

## Reserve loading.
data modify storage egg:pack reserved append from storage egg:pack/preload <<name

## Success.
return 1