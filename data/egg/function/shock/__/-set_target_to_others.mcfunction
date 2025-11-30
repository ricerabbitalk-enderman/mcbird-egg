execute on origin run scoreboard players operation #egg:shock/__/give_to_others|alignment -- = @s egg.alignment

execute if score #egg:shock/__/give_to_others|alignment -- matches 1 run data modify storage egg:shock <<.alignment_min set value -1
execute if score #egg:shock/__/give_to_others|alignment -- matches 1 run data modify storage egg:shock <<.alignment_max set value 0
execute if score #egg:shock/__/give_to_others|alignment -- matches 0 run data modify storage egg:shock <<.alignment_min set value -1
execute if score #egg:shock/__/give_to_others|alignment -- matches 0 run data modify storage egg:shock <<.alignment_max set value 1
execute if score #egg:shock/__/give_to_others|alignment -- matches -1 run data modify storage egg:shock <<.alignment_min set value 0
execute if score #egg:shock/__/give_to_others|alignment -- matches -1 run data modify storage egg:shock <<.alignment_max set value 1

## Success.
return 1