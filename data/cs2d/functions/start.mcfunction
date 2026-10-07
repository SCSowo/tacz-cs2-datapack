# 由管理书「开始比赛」调用：不再自动把未选阵营的人补进队伍，只按已选阵营的人数校验开赛
execute unless score #state cs2d.g matches 5 run tellraw @a {"text":"[CS2] 当前不在停止状态，直接开新一场","color":"yellow"}
execute store result score #t cs2d.tmp if entity @a[team=T]
execute store result score #c cs2d.tmp if entity @a[team=CT]
execute store result score #n cs2d.tmp if entity @a[team=]
scoreboard players set #go cs2d.g 0
execute if score #t cs2d.tmp matches 1.. run scoreboard players set #go cs2d.g 1
execute if score #c cs2d.tmp matches 1.. run scoreboard players set #go cs2d.g 1
execute if score #go cs2d.g matches 1 run scoreboard players set #state cs2d.g 0
execute if score #go cs2d.g matches 1 run function cs2d:match_start
