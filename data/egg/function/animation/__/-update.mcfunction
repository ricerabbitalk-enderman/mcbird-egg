## Update Tick.
scoreboard players add @s egg.animation.__tick 1
## Update Keyframe.
scoreboard players operation @s egg.animation.__tick %= #egg:animation/__/-update.wait --
execute if score @s egg.animation.__tick matches 0 unless function egg:animation/-finished run function egg:animation/__/-next_keyframe

## Success.
return 1
