# 购买 Tec-9  $500（T）
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w2 matches 5 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w2 matches 5 if score @s cs2d.money matches 500.. run function cs2d:buy/grant_tec9
execute if entity @s[team=T] unless score @s cs2d.w2 matches 5 unless score @s cs2d.money matches 500.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
