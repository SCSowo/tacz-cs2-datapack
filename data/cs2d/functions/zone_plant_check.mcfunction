# 下包自检（@s = 玩家）：逐条报出为什么不能安放，并给出正确姿势
scoreboard players set #in cs2d.g 0
execute store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0
execute if score @s cs2d.c4 matches ..0 run title @s actionbar {"text":"你身上没有 C4（每回合随机发给一名 T）","color":"red"}
execute if score @s cs2d.c4 matches 1.. if score #zA cs2d.g matches 0 if score #zB cs2d.g matches 0 run title @s actionbar {"text":"还没设置包点：站到包点上执行 /function cs2d:map/set_zone_a","color":"red"}
execute if score @s cs2d.c4 matches 1.. run function cs2d:zone_in_ab
execute if score @s cs2d.c4 matches 1.. if score #in cs2d.g matches 0 if score #zA cs2d.g matches 1 run title @s actionbar {"text":"不在包点范围内","color":"red"}
execute if score @s cs2d.c4 matches 1.. if score #in cs2d.g matches 0 if score #zB cs2d.g matches 1 run title @s actionbar {"text":"不在包点范围内","color":"red"}
execute if score @s cs2d.c4 matches 1.. if score #in cs2d.g matches 1 run title @s actionbar [{"text":"条件满足 —— ","color":"green"},{"text":"站在原地按住潜行（Shift）4.5 秒","color":"green","bold":true}]
