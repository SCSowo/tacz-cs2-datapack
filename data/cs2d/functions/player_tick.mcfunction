# 玩家每 tick（@s = 玩家）
execute store result score @s cs2d.hp run data get entity @s Health
# 死亡检测
execute if entity @s[scores={cs2d.deaths=1..},gamemode=!spectator] run function cs2d:death
scoreboard players reset @s cs2d.deaths
# 兜底：比赛进行中标记死亡却不是旁观 → 拉回出生点
execute if score #state cs2d.g matches 1..4 if entity @s[tag=cs2d.dead,gamemode=!spectator] run function cs2d:respawn_guard
# 触发器分发
execute if entity @s[scores={cs2d.buy=1..}] run function cs2d:buy
scoreboard players set @s cs2d.buy 0
execute if entity @s[scores={cs2d.plant=1..}] run function cs2d:bomb_plant
scoreboard players set @s cs2d.plant 0
execute if entity @s[scores={cs2d.defl=1..}] run function cs2d:bomb_defuse
scoreboard players set @s cs2d.defl 0
execute if entity @s[scores={cs2d.zset=1..}] run function cs2d:map/zset
scoreboard players set @s cs2d.zset 0
execute if entity @s[scores={cs2d.rad=1..}] run function cs2d:map/rad
scoreboard players set @s cs2d.rad 0
execute if entity @s[scores={cs2d.slot=1..}] run function cs2d:map/slot_pick
scoreboard players set @s cs2d.slot 0
execute if entity @s[scores={cs2d.mapop=1..}] run function cs2d:map/op
scoreboard players set @s cs2d.mapop 0
execute if entity @s[scores={cs2d.ctrl=1..}] run function cs2d:ctrl
scoreboard players set @s cs2d.ctrl 0
execute if entity @s[scores={cs2d.team=1..}] run function cs2d:team_pick
scoreboard players set @s cs2d.team 0
# 蹲着下包（CS2：按住使用键 4.5 秒 —— 这里用潜行代替）
execute if entity @s[team=T,gamemode=!spectator] if score #state cs2d.g matches 2 if score #planted cs2d.g matches 0 run function cs2d:plant_try
execute if entity @s[tag=cs2d.planting] run function cs2d:plant_tick
# zz_deftick_moved_zz  —— 拆除进度推进已上移，勿再加回文件末尾
# 蹲着拆包（CS2：靠近炸弹按住使用键 —— 这里用潜行代替）
execute if entity @s[team=CT,gamemode=!spectator] if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 unless entity @s[tag=cs2d.defusing] run function cs2d:defuse_try
execute if entity @s[tag=cs2d.defusing] run function cs2d:defuse_tick
# 蹲行基准刷新（下一 tick 用来判断是否还蹲着）
scoreboard players operation @s cs2d.snk0 = @s cs2d.snk
# 记录当前位置（死亡时 C4 掉落在死亡原地用；放在死亡检测之后，存的是上一 tick 的位置）
execute store result score @s cs2d.lx run data get entity @s Pos[0]
execute store result score @s cs2d.ly run data get entity @s Pos[1]
execute store result score @s cs2d.lz run data get entity @s Pos[2]
