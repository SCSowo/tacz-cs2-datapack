# 发放 烟雾弹（-$300）
scoreboard players add @s cs2d.ns 1
scoreboard players remove @s cs2d.money 300
scoreboard players set @s cs2d.lb 22
scoreboard players set @s cs2d.lbp 300
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
execute if score @s cs2d.ns matches 1 run item replace entity @s hotbar.5 with lrtactical:throwable{ThrowableId:"lrtactical:smoke_grenade",cs2d_s:5b} 1
