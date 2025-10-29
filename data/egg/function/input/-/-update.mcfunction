## Save Previous Input.
scoreboard players operation @s egg.input.-1 = @s egg.input.+0

## Update use state.
# on pushed
execute if entity @s[advancements={egg:device=true}] run function egg:input/-/-push
# on released
execute if entity @s[advancements={egg:device=false}] run function egg:input/-/-release

## Success.
return 1