## Verify.



## Get alignment.
scoreboard players operation #egg:alignment/-friendly|relationship -- = #egg:alignment/-friendly|<<this --
## Check relationship.
scoreboard players operation #egg:alignment/-friendly|relationship -- *= #egg:alignment/-friendly|<<that --
## Friendly.
execute if score #egg:alignment/-friendly|relationship -- matches 1.. run return 1
## not Friendly.
return 0
