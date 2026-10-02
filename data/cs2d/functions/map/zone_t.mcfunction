# 从矩形变量 #rx1..#rz2 写入T 出生区（支持任意长宽，不必是正方形）
scoreboard players operation #tx1 cs2d.g = #rx1 cs2d.g
scoreboard players operation #tx2 cs2d.g = #rx2 cs2d.g
scoreboard players operation #ty1 cs2d.g = #ry1 cs2d.g
scoreboard players operation #ty2 cs2d.g = #ry2 cs2d.g
scoreboard players operation #tz1 cs2d.g = #rz1 cs2d.g
scoreboard players operation #tz2 cs2d.g = #rz2 cs2d.g
scoreboard players set #zT cs2d.g 1

# 出生点标记（生成在矩形中心）
scoreboard players operation #hx cs2d.g = #tx1 cs2d.g
scoreboard players operation #hx cs2d.g += #tx2 cs2d.g
scoreboard players operation #hx cs2d.g /= #two cs2d.g
scoreboard players operation #hy cs2d.g = #ty1 cs2d.g
scoreboard players operation #hy cs2d.g += #one cs2d.g
scoreboard players operation #hz cs2d.g = #tz1 cs2d.g
scoreboard players operation #hz cs2d.g += #tz2 cs2d.g
scoreboard players operation #hz cs2d.g /= #two cs2d.g
kill @e[type=marker,tag=cs2d.spawnT]
function cs2d:map/mk_at
execute at @e[type=marker,tag=cs2d.tmpmk,limit=1] run summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["cs2d.spawnT"]}
kill @e[type=marker,tag=cs2d.tmpmk]
function cs2d:map/fx_t
