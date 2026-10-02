# 购买 Desert Eagle  $700（双方）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute if score @s cs2d.w2 matches 2 run tellraw @s [{"text": "你已持有 Desert Eagle", "color": "red"}]
execute if score @s cs2d.w2 matches 2 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w2 matches 2 if score @s cs2d.money matches 700.. run function cs2d:buy/grant_deagle
execute unless score @s cs2d.w2 matches 2 unless score @s cs2d.money matches 700.. run tellraw @s [{"text": "金钱不足：Desert Eagle 需要 $700", "color": "red"}]
execute unless score @s cs2d.w2 matches 2 unless score @s cs2d.money matches 700.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
