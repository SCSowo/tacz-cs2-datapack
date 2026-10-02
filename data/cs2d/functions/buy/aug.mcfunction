# 购买 AUG  $3300（CT）
execute unless entity @s[team=CT] run tellraw @s [{"text": "AUG 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 9 run tellraw @s [{"text": "你已持有 AUG", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w1 matches 9 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 9 if score @s cs2d.money matches 3300.. run function cs2d:buy/grant_aug
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 9 unless score @s cs2d.money matches 3300.. run tellraw @s [{"text": "金钱不足：AUG 需要 $3300", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 9 unless score @s cs2d.money matches 3300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
