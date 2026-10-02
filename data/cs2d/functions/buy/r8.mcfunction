# 购买 R8 左轮  $600
execute if score @s cs2d.w2 matches 8 run tellraw @s [{"text": "你已持有 R8 左轮", "color": "red"}]
execute if score @s cs2d.w2 matches 8 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w2 matches 8 if score @s cs2d.money matches 600.. run function cs2d:buy/grant_r8
execute unless score @s cs2d.w2 matches 8 unless score @s cs2d.money matches 600.. run tellraw @s [{"text": "金钱不足：R8 左轮 需要 $600", "color": "red"}]
execute unless score @s cs2d.w2 matches 8 unless score @s cs2d.money matches 600.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
