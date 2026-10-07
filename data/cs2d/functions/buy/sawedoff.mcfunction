# 购买 截短霰弹枪  $1100（T）
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 21 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 21 if score @s cs2d.money matches 1100.. run function cs2d:buy/grant_sawedoff
execute if entity @s[team=T] unless score @s cs2d.w1 matches 21 unless score @s cs2d.money matches 1100.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
