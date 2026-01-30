## Initialize.
execute as @a[tag=!egg.player] run function egg:alignment/__/initialize_player
execute as @e[type=#egg:mob,tag=!egg.mob] run function egg:alignment/__/initialize_mob
## Update.
execute as @e[type=#egg:mob] run function egg:alignment/__/update
