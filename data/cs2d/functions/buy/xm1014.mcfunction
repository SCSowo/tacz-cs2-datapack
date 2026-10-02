# 购买 XM1014  $2000
execute if score @s cs2d.w1 matches 20 run tellraw @s [{"text": "你已持有 XM1014", "color": "red"}]
execute if score @s cs2d.w1 matches 20 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 20 if score @s cs2d.money matches 2000.. run function cs2d:buy/grant_xm1014
execute unless score @s cs2d.w1 matches 20 unless score @s cs2d.money matches 2000.. run tellraw @s [{"text": "金钱不足：XM1014 需要 $2000", "color": "red"}]
execute unless score @s cs2d.w1 matches 20 unless score @s cs2d.money matches 2000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
