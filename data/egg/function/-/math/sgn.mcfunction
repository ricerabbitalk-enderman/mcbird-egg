## Get values sign.
# score <<x  <<| x
# return     >>| sgn x (x<0:-1, x=0:0, x<0:1)

## sgn x.
execute if score #egg:-/math/sgn|<<x -- matches 0 run return 0
execute if score #egg:-/math/sgn|<<x -- matches 1.. run return 1
return -1
