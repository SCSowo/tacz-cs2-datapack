# 购买 AK-47  $2700（T）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=T] run tellraw @s [{"text": "AK-47 仅限 T 阵营", "color": "red"}]
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 4 run tellraw @s [{"text": "你已持有 AK-47", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.w1 matches 4 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 4 if score @s cs2d.money matches 2700.. run function cs2d:buy/grant_ak47
execute if entity @s[team=T] unless score @s cs2d.w1 matches 4 unless score @s cs2d.money matches 2700.. run tellraw @s [{"text": "金钱不足：AK-47 需要 $2700", "color": "red"}]
execute if entity @s[team=T] unless score @s cs2d.w1 matches 4 unless score @s cs2d.money matches 2700.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
