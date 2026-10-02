# 区域设置（站位置上点）
#   1=T家 2=CT家 3=A包点 4=B包点   → 以自己为中心的正方形（同时把该区设为"当前编辑区"）
#   5=记录角①  6=记录角② → 生成矩形（应用到"当前编辑区"）
#   11/12/13/14=选择当前编辑区 T/CT/A/B
execute if score @s cs2d.zset matches 1 run function cs2d:map/set_zone_t
execute if score @s cs2d.zset matches 2 run function cs2d:map/set_zone_ct
execute if score @s cs2d.zset matches 3 run function cs2d:map/set_zone_a
execute if score @s cs2d.zset matches 4 run function cs2d:map/set_zone_b
execute if score @s cs2d.zset matches 1 run scoreboard players set #zedit cs2d.g 1
execute if score @s cs2d.zset matches 2 run scoreboard players set #zedit cs2d.g 2
execute if score @s cs2d.zset matches 3 run scoreboard players set #zedit cs2d.g 3
execute if score @s cs2d.zset matches 4 run scoreboard players set #zedit cs2d.g 4
execute if score @s cs2d.zset matches 5 run function cs2d:map/p1
execute if score @s cs2d.zset matches 6 run function cs2d:map/p2
execute if score @s cs2d.zset matches 11 run scoreboard players set #zedit cs2d.g 1
execute if score @s cs2d.zset matches 12 run scoreboard players set #zedit cs2d.g 2
execute if score @s cs2d.zset matches 13 run scoreboard players set #zedit cs2d.g 3
execute if score @s cs2d.zset matches 14 run scoreboard players set #zedit cs2d.g 4
execute if score @s cs2d.zset matches 11..14 run function cs2d:map/zedit_tell
scoreboard players enable @s cs2d.zset
