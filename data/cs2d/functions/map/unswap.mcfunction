# 【一次性修复】早期版本的 swap_sides 会把 T/CT 区域坐标和出生点 marker 一起交换，
# 已经换过边的存档里这两样处于「交换态」（高光方位反、出生点反）。
# 交换是对合运算 —— 再执行一次就复原。只跑一次；没换过边的话会把它换反，别乱点。
scoreboard players operation #rx1 cs2d.g = #tx1 cs2d.g
scoreboard players operation #tx1 cs2d.g = #cx1 cs2d.g
scoreboard players operation #cx1 cs2d.g = #rx1 cs2d.g
scoreboard players operation #rx2 cs2d.g = #tx2 cs2d.g
scoreboard players operation #tx2 cs2d.g = #cx2 cs2d.g
scoreboard players operation #cx2 cs2d.g = #rx2 cs2d.g
scoreboard players operation #ry1 cs2d.g = #ty1 cs2d.g
scoreboard players operation #ty1 cs2d.g = #cy1 cs2d.g
scoreboard players operation #cy1 cs2d.g = #ry1 cs2d.g
scoreboard players operation #ry2 cs2d.g = #ty2 cs2d.g
scoreboard players operation #ty2 cs2d.g = #cy2 cs2d.g
scoreboard players operation #cy2 cs2d.g = #ry2 cs2d.g
scoreboard players operation #rz1 cs2d.g = #tz1 cs2d.g
scoreboard players operation #tz1 cs2d.g = #cz1 cs2d.g
scoreboard players operation #cz1 cs2d.g = #rz1 cs2d.g
scoreboard players operation #rz2 cs2d.g = #tz2 cs2d.g
scoreboard players operation #tz2 cs2d.g = #cz2 cs2d.g
scoreboard players operation #cz2 cs2d.g = #rz2 cs2d.g
# 出生点 marker 互换（临时 tag 中转，避免互相覆盖）
tag @e[type=marker,tag=cs2d.spawnT] add cs2d.sw
tag @e[type=marker,tag=cs2d.spawnCT] add cs2d.spawnT
tag @e[type=marker,tag=cs2d.sw] remove cs2d.spawnT
tag @e[type=marker,tag=cs2d.spawnCT] remove cs2d.spawnCT
tag @e[type=marker,tag=cs2d.sw] add cs2d.spawnCT
tag @e[type=marker,tag=cs2d.sw] remove cs2d.sw
function cs2d:map/redraw
tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"区域与出生点已复原（撤销旧的换边交换）","color":"yellow"}]
