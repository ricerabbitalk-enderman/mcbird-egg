execute if score @s egg.alignment matches 0 if function egg:alignment/__/conflict run scoreboard players set @s egg.alignment -1
execute if score @s egg.alignment matches -1 unless function egg:alignment/__/conflict run scoreboard players set @s egg.alignment 0
