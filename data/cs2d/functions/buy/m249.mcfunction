# 购买 M249  $5200
execute if score @s cs2d.w1 matches 22 run tellraw @s [{"text": "你已持有 M249", "color": "red"}]
execute if score @s cs2d.w1 matches 22 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 22 if score @s cs2d.money matches 5200.. run function cs2d:buy/grant_m249
execute unless score @s cs2d.w1 matches 22 unless score @s cs2d.money matches 5200.. run tellraw @s [{"text": "金钱不足：M249 需要 $5200", "color": "red"}]
execute unless score @s cs2d.w1 matches 22 unless score @s cs2d.money matches 5200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
