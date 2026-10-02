# 购买 P90  $2350
execute if score @s cs2d.w1 matches 17 run tellraw @s [{"text": "你已持有 P90", "color": "red"}]
execute if score @s cs2d.w1 matches 17 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 17 if score @s cs2d.money matches 2350.. run function cs2d:buy/grant_p90
execute unless score @s cs2d.w1 matches 17 unless score @s cs2d.money matches 2350.. run tellraw @s [{"text": "金钱不足：P90 需要 $2350", "color": "red"}]
execute unless score @s cs2d.w1 matches 17 unless score @s cs2d.money matches 2350.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
