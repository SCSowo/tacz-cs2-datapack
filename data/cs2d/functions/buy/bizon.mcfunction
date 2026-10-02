# 购买 PP-野牛  $1400
execute if score @s cs2d.w1 matches 18 run tellraw @s [{"text": "你已持有 PP-野牛", "color": "red"}]
execute if score @s cs2d.w1 matches 18 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 18 if score @s cs2d.money matches 1400.. run function cs2d:buy/grant_bizon
execute unless score @s cs2d.w1 matches 18 unless score @s cs2d.money matches 1400.. run tellraw @s [{"text": "金钱不足：PP-野牛 需要 $1400", "color": "red"}]
execute unless score @s cs2d.w1 matches 18 unless score @s cs2d.money matches 1400.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
