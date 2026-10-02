# 买新主武器时，把手上已有的那把按原价折回（CS2 同一时间只能有一把主武器）
execute if score @s cs2d.w1p matches 1.. run scoreboard players operation @s cs2d.money += @s cs2d.w1p
execute if score @s cs2d.w1p matches 1.. run tellraw @s [{"text": "[CS2] ", "color": "gold"}, {"text": "已折价退回手上的主武器  +$", "color": "gray"}, {"score": {"name": "@s", "objective": "cs2d.w1p"}, "color": "gold"}]
execute if score @s cs2d.money matches 16001.. run scoreboard players set @s cs2d.money 16000
scoreboard players set @s cs2d.w1p 0
