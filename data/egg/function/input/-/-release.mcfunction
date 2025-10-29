## Update on inactive. 
execute if score @s egg.input.-1 matches 0.. run scoreboard players set @s egg.input.+0 0
scoreboard players remove @s egg.input.+0 1

## Success.
return 1