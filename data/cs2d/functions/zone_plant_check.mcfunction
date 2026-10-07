# 下包自检（@s = 玩家）：反馈已移除，只保留内部 #in / c4 判定
scoreboard players set #in cs2d.g 0
execute store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0
execute if score @s cs2d.c4 matches 1.. run function cs2d:zone_in_ab
