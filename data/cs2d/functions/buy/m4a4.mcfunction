# 购买 M4A4  $3000（CT）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=CT] run tellraw @s [{"text": "M4A4 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 5 run tellraw @s [{"text": "你已持有 M4A4", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w1 matches 5 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 5 if score @s cs2d.money matches 3000.. run function cs2d:buy/grant_m4a4
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 5 unless score @s cs2d.money matches 3000.. run tellraw @s [{"text": "金钱不足：M4A4 需要 $3000", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 5 unless score @s cs2d.money matches 3000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
