# 购买 Nova  $1050
execute if score @s cs2d.w1 matches 19 run tellraw @s [{"text": "你已持有 Nova", "color": "red"}]
execute if score @s cs2d.w1 matches 19 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 19 if score @s cs2d.money matches 1050.. run function cs2d:buy/grant_nova
execute unless score @s cs2d.w1 matches 19 unless score @s cs2d.money matches 1050.. run tellraw @s [{"text": "金钱不足：Nova 需要 $1050", "color": "red"}]
execute unless score @s cs2d.w1 matches 19 unless score @s cs2d.money matches 1050.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
