# 中断安放（@s = 玩家）
tag @s remove cs2d.planting
effect clear @s minecraft:slowness
scoreboard players set @s cs2d.plt 0
bossbar set cs2d:plant visible false
bossbar set cs2d:plant players
