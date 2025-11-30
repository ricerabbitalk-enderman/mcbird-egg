## Set data.
data modify entity @s data merge value {egg:{entity:{}}}
data modify entity @s data.egg.entity.__source set from storage egg:entity/-set_source <<source

## Success.
return 1