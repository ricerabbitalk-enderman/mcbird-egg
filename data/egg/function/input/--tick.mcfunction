## Enable features of input.
execute as @a[tag=!egg.input] run function egg:input/-/-enable
## Update features of input.
execute as @a[tag=egg.input] unless function egg:input/-/-update run function egg:input/-/-disable
