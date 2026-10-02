# 购买 Tec-9  $500（T）
execute unless entity @s[team=T] run tellraw @s [{"text": "Tec-9 仅限 T 阵营", "color": "red"}]
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w2 matches 5 run tellraw @s [{"text": "你已持有 Tec-9", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.w2 matches 5 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w2 matches 5 if score @s cs2d.money matches 500.. run function cs2d:buy/grant_tec9
execute if entity @s[team=T] unless score @s cs2d.w2 matches 5 unless score @s cs2d.money matches 500.. run tellraw @s [{"text": "金钱不足：Tec-9 需要 $500", "color": "red"}]
execute if entity @s[team=T] unless score @s cs2d.w2 matches 5 unless score @s cs2d.money matches 500.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
