# 购买 SG 553  $3000（T）
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 8 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 8 if score @s cs2d.money matches 3000.. run function cs2d:buy/grant_sg553
execute if entity @s[team=T] unless score @s cs2d.w1 matches 8 unless score @s cs2d.money matches 3000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
