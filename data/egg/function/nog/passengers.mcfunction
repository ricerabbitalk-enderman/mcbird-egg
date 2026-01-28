

## Count Passengers.
scoreboard players set #egg:nog/passengers|count -- 0
execute on passengers run scoreboard players add #egg:nog/passengers|count -- 1
## Return.
return run scoreboard players get #egg:nog/passengers|count --