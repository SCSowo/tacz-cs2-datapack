# 退还 Five-SeveN（+$500）
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
clear @s tacz:modern_kinetic_gun{GunId:"lrl:p320_doctor"} 1
scoreboard players add @s cs2d.money 500
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "Five-SeveN", "color": "green"}, {"text": "  +$500", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
