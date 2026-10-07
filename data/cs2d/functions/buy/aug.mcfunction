# 购买 AUG  $3300（CT）
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 9 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 9 if score @s cs2d.money matches 3300.. run function cs2d:buy/grant_aug
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 9 unless score @s cs2d.money matches 3300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
