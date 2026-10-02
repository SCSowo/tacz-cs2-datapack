# 从矩形变量 #rx1..#rz2 写入A 包点（支持任意长宽，不必是正方形）
scoreboard players operation #ax1 cs2d.g = #rx1 cs2d.g
scoreboard players operation #ax2 cs2d.g = #rx2 cs2d.g
scoreboard players operation #ay1 cs2d.g = #ry1 cs2d.g
scoreboard players operation #ay2 cs2d.g = #ry2 cs2d.g
scoreboard players operation #az1 cs2d.g = #rz1 cs2d.g
scoreboard players operation #az2 cs2d.g = #rz2 cs2d.g
scoreboard players set #zA cs2d.g 1
function cs2d:map/fx_a
