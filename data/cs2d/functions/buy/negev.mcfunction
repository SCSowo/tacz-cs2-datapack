# 购买 Negev  $1700
execute if score @s cs2d.w1 matches 23 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 23 if score @s cs2d.money matches 1700.. run function cs2d:buy/grant_negev
execute unless score @s cs2d.w1 matches 23 unless score @s cs2d.money matches 1700.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
