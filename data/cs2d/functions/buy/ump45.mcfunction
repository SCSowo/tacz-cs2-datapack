# 购买 UMP-45  $1200
execute if score @s cs2d.w1 matches 16 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 16 if score @s cs2d.money matches 1200.. run function cs2d:buy/grant_ump45
execute unless score @s cs2d.w1 matches 16 unless score @s cs2d.money matches 1200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
