# 购买 MAC-10  $1050（T）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=T] run tellraw @s [{"text": "MAC-10 仅限 T 阵营", "color": "red"}]
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 1 run tellraw @s [{"text": "你已持有 MAC-10", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.w1 matches 1 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 1 if score @s cs2d.money matches 1050.. run function cs2d:buy/grant_mac10
execute if entity @s[team=T] unless score @s cs2d.w1 matches 1 unless score @s cs2d.money matches 1050.. run tellraw @s [{"text": "金钱不足：MAC-10 需要 $1050", "color": "red"}]
execute if entity @s[team=T] unless score @s cs2d.w1 matches 1 unless score @s cs2d.money matches 1050.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
