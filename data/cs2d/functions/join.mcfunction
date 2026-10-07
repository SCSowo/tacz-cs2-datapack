# 新玩家加入（@s = 玩家）—— 不再自动分队，先发选队菜单让玩家自己选
tag @s add cs2d.in
scoreboard players set @s cs2d.money 800
scoreboard players set @s cs2d.kit 0
scoreboard players set @s cs2d.def 0
scoreboard players set @s cs2d.plt 0
scoreboard players set @s cs2d.c4 0
scoreboard players set @s cs2d.snk0 0
scoreboard players set @s cs2d.mv0 0
tag @s remove cs2d.planting
tag @s remove cs2d.atbomb
tag @s remove cs2d.warnz
scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
scoreboard players set @s cs2d.nf 0
scoreboard players set @s cs2d.nh 0
scoreboard players set @s cs2d.ns 0
scoreboard players set @s cs2d.nm 0
scoreboard players set @s cs2d.arm 0
scoreboard players set @s cs2d.kills 0
execute unless score @s cs2d.mvp matches 0.. run scoreboard players set @s cs2d.mvp 0
# 未选阵营：等待中保持冒险模式方便等待；比赛进行中则先旁观
execute unless score #state cs2d.g matches 1..4 run gamemode adventure @s
execute if score #state cs2d.g matches 1..4 run gamemode spectator @s
execute if score #state cs2d.g matches 1..4 run tag @s add cs2d.dead
# 发选队菜单
function cs2d:team/book
# 开放所有 trigger
function cs2d:unlock
tellraw @a [{"nbt":"Name","entity":"@s","color":"gray"},{"text":" 加入了服务器 — 正在选择阵营","color":"gray"}]
execute if score #state cs2d.g matches 1..4 run title @s subtitle {"text":"比赛进行中，选好阵营后下一回合上场","color":"gray"}
