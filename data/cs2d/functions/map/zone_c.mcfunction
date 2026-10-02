# 从矩形变量 #rx1..#rz2 写入CT 出生区（支持任意长宽，不必是正方形）
scoreboard players operation #cx1 cs2d.g = #rx1 cs2d.g
scoreboard players operation #cx2 cs2d.g = #rx2 cs2d.g
scoreboard players operation #cy1 cs2d.g = #ry1 cs2d.g
scoreboard players operation #cy2 cs2d.g = #ry2 cs2d.g
scoreboard players operation #cz1 cs2d.g = #rz1 cs2d.g
scoreboard players operation #cz2 cs2d.g = #rz2 cs2d.g
scoreboard players set #zC cs2d.g 1

# 出生点标记（生成在矩形中心）
scoreboard players operation #hx cs2d.g = #cx1 cs2d.g
scoreboard players operation #hx cs2d.g += #cx2 cs2d.g
scoreboard players operation #hx cs2d.g /= #two cs2d.g
scoreboard players operation #hy cs2d.g = #cy1 cs2d.g
scoreboard players operation #hy cs2d.g += #one cs2d.g
scoreboard players operation #hz cs2d.g = #cz1 cs2d.g
scoreboard players operation #hz cs2d.g += #cz2 cs2d.g
scoreboard players operation #hz cs2d.g /= #two cs2d.g
kill @e[type=marker,tag=cs2d.spawnCT]
function cs2d:map/mk_at
execute at @e[type=marker,tag=cs2d.tmpmk,limit=1] run summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["cs2d.spawnCT"]}
kill @e[type=marker,tag=cs2d.tmpmk]
function cs2d:map/fx_c
