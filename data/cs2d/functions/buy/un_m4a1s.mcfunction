# 退还 M4A1-S（+$2900）
scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
clear @s tacz:modern_kinetic_gun{GunId:"cs2_wt:m4a1"} 1
scoreboard players add @s cs2d.money 2900
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "M4A1-S", "color": "green"}, {"text": "  +$2900", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
