## Set source position.
execute on origin run data modify storage egg:shock source set from entity @s Pos
data modify storage egg:shock <<.source_x set from storage egg:shock source[0]
data modify storage egg:shock <<.source_y set from storage egg:shock source[1]
data modify storage egg:shock <<.source_z set from storage egg:shock source[2]

## Success.
return 1