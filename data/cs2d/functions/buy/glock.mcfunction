# 购买 Glock-18  $200（T）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=T] run tellraw @s [{"text": "Glock-18 仅限 T 阵营", "color": "red"}]
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w2 matches 0 run tellraw @s [{"text": "你已持有 Glock-18", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.w2 matches 0 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w2 matches 0 if score @s cs2d.money matches 200.. run function cs2d:buy/grant_glock
execute if entity @s[team=T] unless score @s cs2d.w2 matches 0 unless score @s cs2d.money matches 200.. run tellraw @s [{"text": "金钱不足：Glock-18 需要 $200", "color": "red"}]
execute if entity @s[team=T] unless score @s cs2d.w2 matches 0 unless score @s cs2d.money matches 200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
