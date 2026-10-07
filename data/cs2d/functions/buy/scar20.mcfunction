# 购买 SCAR-20  $5000（CT）
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 12 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 12 if score @s cs2d.money matches 5000.. run function cs2d:buy/grant_scar20
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 12 unless score @s cs2d.money matches 5000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
