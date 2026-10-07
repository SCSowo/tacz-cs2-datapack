# 购买 MP9  $1250（CT）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.w1 matches 2 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 2 if score @s cs2d.money matches 1250.. run function cs2d:buy/grant_mp9
execute if entity @s[team=CT] unless score @s cs2d.w1 matches 2 unless score @s cs2d.money matches 1250.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
