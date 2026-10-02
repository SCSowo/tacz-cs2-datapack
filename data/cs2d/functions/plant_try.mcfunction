# 每 tick：T 且回合进行中且未安放 → 判断是否开始蹲下安放（@s = 玩家）
# 本 tick 是否蹲着 → #snk 1/0（NBT 主判据 + sneak_time 备判据）
scoreboard players set #snk cs2d.tmp 0
execute if entity @s[nbt={Sneaking:1b}] run scoreboard players set #snk cs2d.tmp 1
execute if score @s cs2d.snk > @s cs2d.snk0 run scoreboard players set #snk cs2d.tmp 1
# 身上有没有 C4（clear 0 = 只统计不移除；不能用 nbt=Inventory[...] 列表匹配）
execute store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0
# 包点没设过 → 提示一次（打 tag 防刷屏）
execute if score #zA cs2d.g matches 0 if score #zB cs2d.g matches 0 unless entity @s[tag=cs2d.warnz] run tellraw @s {"text":"尚未设置包点范围：站到包点上执行 /function cs2d:map/set_zone_a","color":"red"}
execute if score #zA cs2d.g matches 0 if score #zB cs2d.g matches 0 run tag @s add cs2d.warnz
execute if score #zA cs2d.g matches 1 run tag @s remove cs2d.warnz
execute if score #zB cs2d.g matches 1 run tag @s remove cs2d.warnz
# 可安放 = 有 C4 且站在包点内
scoreboard players set #can cs2d.tmp 0
execute if score @s cs2d.c4 matches 1.. run function cs2d:zone_in_ab
execute if score @s cs2d.c4 matches 1.. if score #in cs2d.g matches 1 run scoreboard players set #can cs2d.tmp 1
# 蹲下 → 开始安放
execute if score #can cs2d.tmp matches 1 if score #snk cs2d.tmp matches 1 unless entity @s[tag=cs2d.planting] run function cs2d:plant_go
# zz_no_atbomb_zz 进入包点不再弹提示
