# 购买 AWP  $4750（双方）
# 防重复：已持有同款直接拒绝（想换枪请先退款再买）
execute if score @s cs2d.w1 matches 6 run tellraw @s [{"text": "你已持有 AWP", "color": "red"}]
execute if score @s cs2d.w1 matches 6 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 6 if score @s cs2d.money matches 4750.. run function cs2d:buy/grant_awp
execute unless score @s cs2d.w1 matches 6 unless score @s cs2d.money matches 4750.. run tellraw @s [{"text": "金钱不足：AWP 需要 $4750", "color": "red"}]
execute unless score @s cs2d.w1 matches 6 unless score @s cs2d.money matches 4750.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
