# 购买 双持贝瑞塔  $300
execute if score @s cs2d.w2 matches 7 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w2 matches 7 if score @s cs2d.money matches 300.. run function cs2d:buy/grant_dual
execute unless score @s cs2d.w2 matches 7 unless score @s cs2d.money matches 300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
