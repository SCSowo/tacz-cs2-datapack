# 购买 MAG-7  $1300（CT）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=CT] run tellraw @s [{"text": "MAG-7 仅限 CT 阵营", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 7 run tellraw @s [{"text": "你已持有 MAG-7", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.w1 matches 7 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 7 if score @s cs2d.money matches 1300.. run function cs2d:buy/grant_mag7
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 7 unless score @s cs2d.money matches 1300.. run tellraw @s [{"text": "金钱不足：MAG-7 需要 $1300", "color": "red"}]
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 7 unless score @s cs2d.money matches 1300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
