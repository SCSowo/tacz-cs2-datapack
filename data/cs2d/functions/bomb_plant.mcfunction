# 安放炸弹（@s = 玩家）：自检反馈已移除，仅开放 trigger 并做内部自检
execute if score #state cs2d.g matches 2 if entity @s[team=T,gamemode=!spectator] if score #planted cs2d.g matches 0 run function cs2d:zone_plant_check
scoreboard players enable @s cs2d.plant
