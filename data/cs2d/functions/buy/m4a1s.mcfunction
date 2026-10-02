# 购买 M4A1-S  $2900（CT）
execute unless entity @s[team=CT] run tellraw @s [{"text": "M4A1-S 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 14 run tellraw @s [{"text": "你已持有 M4A1-S", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w1 matches 14 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 14 if score @s cs2d.money matches 2900.. run function cs2d:buy/grant_m4a1s
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 14 unless score @s cs2d.money matches 2900.. run tellraw @s [{"text": "金钱不足：M4A1-S 需要 $2900", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 14 unless score @s cs2d.money matches 2900.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
