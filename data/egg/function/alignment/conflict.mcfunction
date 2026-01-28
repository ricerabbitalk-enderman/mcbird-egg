## Verify.





## Get alignment.
scoreboard players operation #egg:alignment/-conflict|relationship -- = #egg:alignment/-conflict|<<this --
## Check relationship.
scoreboard players operation #egg:alignment/-conflict|relationship -- *= #egg:alignment/-conflict|<<that --
## Conflict.
execute if score #egg:alignment/-conflict|relationship -- matches ..-1 run return 1
## not Conflict.
return 0
