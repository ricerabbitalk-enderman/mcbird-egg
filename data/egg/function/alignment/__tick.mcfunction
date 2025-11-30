## Initialize.
# Hostile entities.
scoreboard players set @e[type=#egg:mob/hostile,predicate=!egg:mob/has_alignment] egg.alignment -1
# Newtral entities.
scoreboard players set @e[type=#egg:mob/newtral,predicate=!egg:mob/has_alignment] egg.alignment 0
# Passive entities.
scoreboard players set @e[type=#egg:mob/passive,predicate=!egg:mob/has_alignment] egg.alignment 0

## Conflictable entities.
execute as @e[type=#egg:mob/conflictable,scores={egg.alignment=0}] if function egg:alignment/__/conflict run scoreboard players set @s egg.alignment -1
execute as @e[type=#egg:mob/conflictable,scores={egg.alignment=-1}] unless function egg:alignment/__/conflict run scoreboard players set @s egg.alignment 0
## Nocturnal entities.
scoreboard players set @e[type=#egg:mob/nocturnal,predicate=egg:mob/is_in_dark,scores={egg.alignment=0}] egg.alignment -1
scoreboard players set @e[type=#egg:mob/nocturnal,predicate=!egg:mob/is_in_dark,scores={egg.alignment=-1}] egg.alignment 0
## Trusting entities.
scoreboard players set @e[type=#egg:mob/trust,predicate=egg:mob/is_trusting,scores={egg.alignment=0}] egg.alignment 1
scoreboard players set @e[type=#egg:mob/trust,predicate=!egg:mob/is_trusting,scores={egg.alignment=1}] egg.alignment 0
## Tameable entities.
execute as @e[type=#egg:mob/tameable,scores={egg.alignment=0}] if function egg:alignment/__/tamed run scoreboard players set @s egg.alignment 1
execute as @e[type=#egg:mob/tameable,scores={egg.alignment=1}] unless function egg:alignment/__/tamed run scoreboard players set @s egg.alignment 0
