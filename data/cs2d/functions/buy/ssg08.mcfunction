# 购买 SSG 08  $1700
execute if score @s cs2d.w1 matches 11 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 11 if score @s cs2d.money matches 1700.. run function cs2d:buy/grant_ssg08
execute unless score @s cs2d.w1 matches 11 unless score @s cs2d.money matches 1700.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
