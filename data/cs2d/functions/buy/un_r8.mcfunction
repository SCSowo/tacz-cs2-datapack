# 退还 R8 左轮（+$600）
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
clear @s tacz:modern_kinetic_gun{GunId:"lradd:malorian"} 1
scoreboard players add @s cs2d.money 600
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "R8 左轮", "color": "green"}, {"text": "  +$600", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
