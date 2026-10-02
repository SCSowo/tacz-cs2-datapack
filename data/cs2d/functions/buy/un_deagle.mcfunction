# 退还 Desert Eagle（+$700）
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
clear @s tacz:modern_kinetic_gun{GunId:"cs2_wt:deagle"} 1
execute if entity @s[team=T] run function cs2d:gun/glock
execute if entity @s[team=CT] run function cs2d:gun/usp
scoreboard players add @s cs2d.money 700
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "Desert Eagle", "color": "green"}, {"text": "  +$700", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
