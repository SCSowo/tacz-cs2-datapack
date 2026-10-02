# 购买 Negev  $1700
execute if score @s cs2d.w1 matches 23 run tellraw @s [{"text": "你已持有 Negev", "color": "red"}]
execute if score @s cs2d.w1 matches 23 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 23 if score @s cs2d.money matches 1700.. run function cs2d:buy/grant_negev
execute unless score @s cs2d.w1 matches 23 unless score @s cs2d.money matches 1700.. run tellraw @s [{"text": "金钱不足：Negev 需要 $1700", "color": "red"}]
execute unless score @s cs2d.w1 matches 23 unless score @s cs2d.money matches 1700.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
