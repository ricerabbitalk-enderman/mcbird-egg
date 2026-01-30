execute if predicate egg:mob/is_in_dark if score @s egg.alignment matches 0 run scoreboard players set @s egg.alignment -1
execute unless predicate egg:mob/is_in_dark if score @s egg.alignment matches -1 run scoreboard players set @s egg.alignment 0
