# 退还 双持贝瑞塔（+$300）
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
clear @s tacz:modern_kinetic_gun{GunId:"tacz:b93r"} 1
scoreboard players add @s cs2d.money 300
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "双持贝瑞塔", "color": "green"}, {"text": "  +$300", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
