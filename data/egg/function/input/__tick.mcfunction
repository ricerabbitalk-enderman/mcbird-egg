## Enable features of input.
execute as @a[tag=!egg.input] run function egg:input/__/-enable
## Update features of input.
execute as @a[tag=egg.input] unless function egg:input/__/-update run function egg:input/__/-disable
