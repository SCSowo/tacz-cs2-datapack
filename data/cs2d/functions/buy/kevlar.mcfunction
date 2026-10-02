# 购买凯夫拉背心  $650
execute if score @s cs2d.arm matches 1.. run tellraw @s [{"text": "你已有护甲", "color": "red"}]
execute if score @s cs2d.arm matches 1.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if score @s cs2d.arm matches 0 if score @s cs2d.money matches 650.. run function cs2d:buy/grant_kevlar
execute if score @s cs2d.arm matches 0 unless score @s cs2d.money matches 650.. run tellraw @s [{"text": "金钱不足：凯夫拉背心 需要 $650", "color": "red"}]
execute if score @s cs2d.arm matches 0 unless score @s cs2d.money matches 650.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
