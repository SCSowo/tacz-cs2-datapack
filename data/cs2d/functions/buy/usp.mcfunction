# 购买 USP-S  $200（CT）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w2 matches 0 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w2 matches 0 if score @s cs2d.money matches 200.. run function cs2d:buy/grant_usp
execute if entity @s[team=CT] unless score @s cs2d.w2 matches 0 unless score @s cs2d.money matches 200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
