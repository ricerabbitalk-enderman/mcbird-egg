## State.
# Active
execute if function chick:system/running \
  run tellraw @a [{translate:"chick.name",fallback:"chick"},{text:": "},{translate:"chick.state.running",fallback:"\u25B6"}]
# Inactive
execute unless function chick:system/running \
  run tellraw @a [{translate:"chick.name",fallback:"chick"},{text:": "},{translate:"chick.state.running",fallback:"\u23F9"}]
