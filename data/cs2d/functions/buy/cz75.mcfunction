# 购买 CZ75-Auto  $500
execute if score @s cs2d.w2 matches 6 run tellraw @s [{"text": "你已持有 CZ75-Auto", "color": "red"}]
execute if score @s cs2d.w2 matches 6 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w2 matches 6 if score @s cs2d.money matches 500.. run function cs2d:buy/grant_cz75
execute unless score @s cs2d.w2 matches 6 unless score @s cs2d.money matches 500.. run tellraw @s [{"text": "金钱不足：CZ75-Auto 需要 $500", "color": "red"}]
execute unless score @s cs2d.w2 matches 6 unless score @s cs2d.money matches 500.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
