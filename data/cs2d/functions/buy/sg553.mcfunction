# 购买 SG 553  $3000（T）
execute unless entity @s[team=T] run tellraw @s [{"text": "SG 553 仅限 T 阵营", "color": "red"}]
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 8 run tellraw @s [{"text": "你已持有 SG 553", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.w1 matches 8 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 8 if score @s cs2d.money matches 3000.. run function cs2d:buy/grant_sg553
execute if entity @s[team=T] unless score @s cs2d.w1 matches 8 unless score @s cs2d.money matches 3000.. run tellraw @s [{"text": "金钱不足：SG 553 需要 $3000", "color": "red"}]
execute if entity @s[team=T] unless score @s cs2d.w1 matches 8 unless score @s cs2d.money matches 3000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
