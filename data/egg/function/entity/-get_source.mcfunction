## Get from source.
execute if data entity @s data.egg.entity.__source \
  run return run data modify storage egg:entity/-get_source >>source set from entity @s data.egg.entity.__source
## Get this.
return run data modify storage egg:entity/-get_source >>source set from entity @s UUID