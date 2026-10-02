# 保存当前四个区域到槽位 #slot
# 记录：每区 6 个坐标（x1 y1 z1 x2 y2 z2）× 4 + 四个启用标志 = 28 个数
execute as @e[type=marker,tag=cs2d.map] if score @s cs2d.mslot = #slot cs2d.g run kill @s
data remove storage cs2d:tmp z
data modify storage cs2d:tmp z set value []
# T 出生区
execute store result storage cs2d:tmp v int 1 run scoreboard players get #tx1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #tx2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #ty1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #ty2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #tz1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #tz2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
# CT 出生区
execute store result storage cs2d:tmp v int 1 run scoreboard players get #cx1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #cx2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #cy1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #cy2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #cz1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #cz2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
# A 包点
execute store result storage cs2d:tmp v int 1 run scoreboard players get #ax1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #ax2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #ay1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #ay2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #az1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #az2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
# B 包点
execute store result storage cs2d:tmp v int 1 run scoreboard players get #bx1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #bx2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #by1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #by2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #bz1 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #bz2 cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #zT cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #zC cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #zA cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
execute store result storage cs2d:tmp v int 1 run scoreboard players get #zB cs2d.g
data modify storage cs2d:tmp z append from storage cs2d:tmp v
# 写入记录实体
summon minecraft:marker ~ ~ ~ {Tags:["cs2d.map","cs2d.newmap"]}
scoreboard players operation @e[tag=cs2d.newmap,limit=1] cs2d.mslot = #slot cs2d.g
data modify entity @e[tag=cs2d.newmap,limit=1] data set from storage cs2d:tmp z
data modify entity @e[tag=cs2d.newmap,limit=1] CustomName set value '{"text":"未命名地图","italic":false}'
tag @e[tag=cs2d.newmap] remove cs2d.newmap
tellraw @a [{"text":"[CS2] 已保存当前区域（含矩形范围）→ 槽位 ","color":"green"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"gold"}]
