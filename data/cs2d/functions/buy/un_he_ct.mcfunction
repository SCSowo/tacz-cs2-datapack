# 退还 高爆手雷（+$300）
scoreboard players remove @s cs2d.nh 1
scoreboard players add @s cs2d.money 300
execute if score @s cs2d.nh matches 1 run item replace entity @s hotbar.4 with lrtactical:throwable{ThrowableId:"lrtactical:m67",cs2d_s:4b} 1
execute unless score @s cs2d.nh matches 1.. run item replace entity @s hotbar.5 with minecraft:air
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "高爆手雷", "color": "green"}, {"text": "  +$300", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
