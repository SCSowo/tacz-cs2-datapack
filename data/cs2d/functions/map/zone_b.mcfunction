# 从矩形变量 #rx1..#rz2 写入B 包点（支持任意长宽，不必是正方形）
scoreboard players operation #bx1 cs2d.g = #rx1 cs2d.g
scoreboard players operation #bx2 cs2d.g = #rx2 cs2d.g
scoreboard players operation #by1 cs2d.g = #ry1 cs2d.g
scoreboard players operation #by2 cs2d.g = #ry2 cs2d.g
scoreboard players operation #bz1 cs2d.g = #rz1 cs2d.g
scoreboard players operation #bz2 cs2d.g = #rz2 cs2d.g
scoreboard players set #zB cs2d.g 1
function cs2d:map/fx_b
