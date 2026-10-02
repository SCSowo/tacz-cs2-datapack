# 购买 高爆手雷  $300（最多 1 个）
execute if score @s cs2d.nh matches 1.. run tellraw @s [{"text": "高爆手雷 已达上限（1 个）", "color": "red"}]
execute if score @s cs2d.nh matches 1.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.nh matches ..0 if score @s cs2d.money matches 300.. run function cs2d:buy/grant_he_t
execute if entity @s[team=T] if score @s cs2d.nh matches ..0 unless score @s cs2d.money matches 300.. run tellraw @s [{"text": "金钱不足：高爆手雷 需要 $300", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.nh matches ..0 unless score @s cs2d.money matches 300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.nh matches ..0 if score @s cs2d.money matches 300.. run function cs2d:buy/grant_he_ct
execute if entity @s[team=CT] if score @s cs2d.nh matches ..0 unless score @s cs2d.money matches 300.. run tellraw @s [{"text": "金钱不足：高爆手雷 需要 $300", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.nh matches ..0 unless score @s cs2d.money matches 300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
