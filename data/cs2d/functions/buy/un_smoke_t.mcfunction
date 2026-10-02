# 退还 烟雾弹（+$300）
scoreboard players remove @s cs2d.ns 1
scoreboard players add @s cs2d.money 300
execute if score @s cs2d.ns matches 1 run item replace entity @s hotbar.5 with lrtactical:throwable{ThrowableId:"lrtactical:smoke_grenade",cs2d_s:5b} 1
execute unless score @s cs2d.ns matches 1.. run item replace entity @s hotbar.6 with minecraft:air
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "烟雾弹", "color": "green"}, {"text": "  +$300", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
