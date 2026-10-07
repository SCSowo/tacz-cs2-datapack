# 全员退出阵营并重新发选队菜单
team leave @a
clear @a
gamemode adventure @a
tag @a remove cs2d.dead
tag @a remove cs2d.defusing
scoreboard players set @a cs2d.money 800
scoreboard players set @a cs2d.w1 0
scoreboard players set @a cs2d.w1p 0
scoreboard players set @a cs2d.w2 0
scoreboard players set @a cs2d.w2p 0
scoreboard players set @a cs2d.nf 0
scoreboard players set @a cs2d.nh 0
scoreboard players set @a cs2d.ns 0
scoreboard players set @a cs2d.nm 0
scoreboard players set @a cs2d.arm 0
scoreboard players set @a cs2d.kit 0
execute as @a run function cs2d:team/book
tellraw @a [{"text":"[CS2] 全员已退出阵营，请从聊天栏选边菜单重新选边","color":"yellow"}]
