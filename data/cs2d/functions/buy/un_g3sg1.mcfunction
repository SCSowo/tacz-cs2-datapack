# 退还 G3SG1（+$5000）
scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
clear @s tacz:modern_kinetic_gun{GunId:"lradd:g3_sg2"} 1
scoreboard players add @s cs2d.money 5000
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "G3SG1", "color": "green"}, {"text": "  +$5000", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
