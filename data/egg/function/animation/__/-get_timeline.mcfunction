## Get timeline.
data modify storage egg:animation/__/-get_timeline data set value {}
data modify storage egg:animation/__/-get_timeline data.path set from entity @s data.egg.animation.__info.path
execute store result storage egg:animation/__/-get_timeline data.page int 1 run scoreboard players get @s egg.animation.__page
function egg:animation/__/macro/-get_timeline with storage egg:animation/__/-get_timeline data

## Success.
return 1