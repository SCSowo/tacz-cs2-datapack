# 购买 G3SG1  $5000（T）
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 13 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 13 if score @s cs2d.money matches 5000.. run function cs2d:buy/grant_g3sg1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 13 unless score @s cs2d.money matches 5000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
