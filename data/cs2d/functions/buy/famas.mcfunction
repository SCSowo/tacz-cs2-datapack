# 购买 FAMAS  $2050（CT）
execute unless entity @s[team=CT] run tellraw @s [{"text": "FAMAS 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 10 run tellraw @s [{"text": "你已持有 FAMAS", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w1 matches 10 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 10 if score @s cs2d.money matches 2050.. run function cs2d:buy/grant_famas
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 10 unless score @s cs2d.money matches 2050.. run tellraw @s [{"text": "金钱不足：FAMAS 需要 $2050", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 10 unless score @s cs2d.money matches 2050.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
