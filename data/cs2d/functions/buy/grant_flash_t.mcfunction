# 发放 闪光弹（-$200）
scoreboard players add @s cs2d.nf 1
scoreboard players remove @s cs2d.money 200
scoreboard players set @s cs2d.lb 20
scoreboard players set @s cs2d.lbp 200
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
execute if score @s cs2d.nf matches 1 run item replace entity @s hotbar.3 with lrtactical:throwable{ThrowableId:"lrtactical:flash_grenade",cs2d_s:3b} 1
