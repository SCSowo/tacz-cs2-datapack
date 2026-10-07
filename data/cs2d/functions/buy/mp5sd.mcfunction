# 购买 MP5-SD  $1500
execute if score @s cs2d.w1 matches 15 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 15 if score @s cs2d.money matches 1500.. run function cs2d:buy/grant_mp5sd
execute unless score @s cs2d.w1 matches 15 unless score @s cs2d.money matches 1500.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
