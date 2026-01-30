## Verify.
execute unless data storage egg:pack/preload <<name run return run function egg:__/error/throw {message:"[ERROR] function egg:pack/preload (2): storage not found (storage egg:pack/preload <<name)",storage:"egg:pack/preload",nbt:"<<name"}

## Reserve loading.
data modify storage egg:pack reserved append from storage egg:pack/preload <<name

## Success.
return 1