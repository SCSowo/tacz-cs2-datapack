# 购买 SCAR-20  $5000（CT）
execute unless entity @s[team=CT] run tellraw @s [{"text": "SCAR-20 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 12 run tellraw @s [{"text": "你已持有 SCAR-20", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w1 matches 12 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 12 if score @s cs2d.money matches 5000.. run function cs2d:buy/grant_scar20
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 12 unless score @s cs2d.money matches 5000.. run tellraw @s [{"text": "金钱不足：SCAR-20 需要 $5000", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 12 unless score @s cs2d.money matches 5000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
