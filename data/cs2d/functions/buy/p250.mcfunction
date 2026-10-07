# 购买 P250  $300
execute if score @s cs2d.w2 matches 3 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w2 matches 3 if score @s cs2d.money matches 300.. run function cs2d:buy/grant_p250
execute unless score @s cs2d.w2 matches 3 unless score @s cs2d.money matches 300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
