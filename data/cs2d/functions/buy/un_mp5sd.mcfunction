# 退还 MP5-SD（+$1500）
scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
clear @s tacz:modern_kinetic_gun{GunId:"tacz:hk_mp5a5"} 1
scoreboard players add @s cs2d.money 1500
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "MP5-SD", "color": "green"}, {"text": "  +$1500", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
