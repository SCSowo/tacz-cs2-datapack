# 全员重选阵营：比赛进行中不允许
execute if score #state cs2d.g matches 1..4 run tellraw @s {"text":"[CS2] 比赛进行中，请先点「强制停止」","color":"red"}
execute unless score #state cs2d.g matches 1..4 run function cs2d:team/reset_go
