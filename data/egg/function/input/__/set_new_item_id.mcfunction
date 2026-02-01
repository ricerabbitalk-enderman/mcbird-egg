## Set item ID.
data modify storage egg:input data set value {}
execute store result storage egg:input data.id int 1 run function egg:input/__/publish_id

## Success.
return 1