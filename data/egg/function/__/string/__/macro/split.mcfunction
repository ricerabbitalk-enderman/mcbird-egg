$data modify storage egg:__/string/__/macro/split >>string set string storage egg:__/string/__/macro/split <<string $(begin) $(end)
tellraw @a {storage:"egg:__/string/__/macro/split",nbt:">>string"}
return 1
