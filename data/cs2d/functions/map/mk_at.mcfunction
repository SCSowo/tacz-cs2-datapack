# 把 #hx/#hy/#hz 作为绝对坐标生成一个临时 marker（tag cs2d.tmpmk）
# 用法：先设 #hx/#hy/#hz → function 本文件 → execute at @e[tag=cs2d.tmpmk,limit=1] run ... → kill @e[tag=cs2d.tmpmk]
kill @e[type=marker,tag=cs2d.tmpmk]
summon minecraft:marker ~ ~ ~ {Tags:["cs2d.tmpmk"]}
data modify storage cs2d:tmp pos set value [0.0d,0.0d,0.0d]
execute store result storage cs2d:tmp pos[0] double 1 run scoreboard players get #hx cs2d.g
execute store result storage cs2d:tmp pos[1] double 1 run scoreboard players get #hy cs2d.g
execute store result storage cs2d:tmp pos[2] double 1 run scoreboard players get #hz cs2d.g
data modify entity @e[type=marker,tag=cs2d.tmpmk,limit=1] Pos set from storage cs2d:tmp pos
