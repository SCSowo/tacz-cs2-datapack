# 购买 Five-SeveN  $500（CT）
execute unless entity @s[team=CT] run tellraw @s [{"text": "Five-SeveN 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w2 matches 4 run tellraw @s [{"text": "你已持有 Five-SeveN", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w2 matches 4 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w2 matches 4 if score @s cs2d.money matches 500.. run function cs2d:buy/grant_fiveseven
execute if entity @s[team=CT] unless score @s cs2d.w2 matches 4 unless score @s cs2d.money matches 500.. run tellraw @s [{"text": "金钱不足：Five-SeveN 需要 $500", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w2 matches 4 unless score @s cs2d.money matches 500.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
