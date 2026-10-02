# 购买 UMP-45  $1200
execute if score @s cs2d.w1 matches 16 run tellraw @s [{"text": "你已持有 UMP-45", "color": "red"}]
execute if score @s cs2d.w1 matches 16 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute unless score @s cs2d.w1 matches 16 if score @s cs2d.money matches 1200.. run function cs2d:buy/grant_ump45
execute unless score @s cs2d.w1 matches 16 unless score @s cs2d.money matches 1200.. run tellraw @s [{"text": "金钱不足：UMP-45 需要 $1200", "color": "red"}]
execute unless score @s cs2d.w1 matches 16 unless score @s cs2d.money matches 1200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
