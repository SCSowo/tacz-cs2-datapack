# 发放 燃烧瓶（-$400）
scoreboard players add @s cs2d.nm 1
scoreboard players remove @s cs2d.money 400
scoreboard players set @s cs2d.lb 23
scoreboard players set @s cs2d.lbp 400
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
execute if score @s cs2d.nm matches 1 run item replace entity @s hotbar.6 with lrtactical:throwable{ThrowableId:"lrtactical:molotov",cs2d_s:6b} 1
