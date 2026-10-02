# 提示当前编辑区
execute if score #zedit cs2d.g matches 1 run tellraw @a [{"text":"[CS2] 当前编辑区 → ","color":"green"},{"text":"T 出生区","color":"gold","bold":true}]
execute if score #zedit cs2d.g matches 2 run tellraw @a [{"text":"[CS2] 当前编辑区 → ","color":"green"},{"text":"CT 出生区","color":"blue","bold":true}]
execute if score #zedit cs2d.g matches 3 run tellraw @a [{"text":"[CS2] 当前编辑区 → ","color":"green"},{"text":"A 包点","color":"gold","bold":true}]
execute if score #zedit cs2d.g matches 4 run tellraw @a [{"text":"[CS2] 当前编辑区 → ","color":"green"},{"text":"B 包点","color":"green","bold":true}]
