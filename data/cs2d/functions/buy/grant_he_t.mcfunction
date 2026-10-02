# 发放 高爆手雷（-$300）
scoreboard players add @s cs2d.nh 1
scoreboard players remove @s cs2d.money 300
scoreboard players set @s cs2d.lb 21
scoreboard players set @s cs2d.lbp 300
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
execute if score @s cs2d.nh matches 1 run item replace entity @s hotbar.4 with lrtactical:throwable{ThrowableId:"lrtactical:m67",cs2d_s:4b} 1
