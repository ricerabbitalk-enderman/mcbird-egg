## Next page.
scoreboard players add @s egg.animation.__page 1
## Repeat.
execute if score @s egg.animation.__page = @s egg.animation.__count run return run function egg:animation/__/-repeat
## Get timeline.
function egg:animation/__/-get_timeline
## Next keyframe.
return run function egg:animation/__/-next_keyframe
