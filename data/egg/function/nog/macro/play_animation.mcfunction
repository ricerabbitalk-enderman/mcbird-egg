## Verify.

## Play.
$data modify storage egg:animation/-set << set value {repeat:$(repeat),path:$(model)-$(anime)}
execute unless function egg:animation/-set run return 0
execute unless function egg:animation/-play run return 0

## Success.
return 1