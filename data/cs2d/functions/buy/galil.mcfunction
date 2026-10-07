# 购买 Galil AR  $1800（T）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 3 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 3 if score @s cs2d.money matches 1800.. run function cs2d:buy/grant_galil
execute if entity @s[team=T] unless score @s cs2d.w1 matches 3 unless score @s cs2d.money matches 1800.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
