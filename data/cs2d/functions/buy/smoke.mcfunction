# 购买 烟雾弹  $300（最多 1 个）
execute if score @s cs2d.ns matches 1.. run tellraw @s [{"text": "烟雾弹 已达上限（1 个）", "color": "red"}]
execute if score @s cs2d.ns matches 1.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.ns matches ..0 if score @s cs2d.money matches 300.. run function cs2d:buy/grant_smoke_t
execute if entity @s[team=T] if score @s cs2d.ns matches ..0 unless score @s cs2d.money matches 300.. run tellraw @s [{"text": "金钱不足：烟雾弹 需要 $300", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.ns matches ..0 unless score @s cs2d.money matches 300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.ns matches ..0 if score @s cs2d.money matches 300.. run function cs2d:buy/grant_smoke_ct
execute if entity @s[team=CT] if score @s cs2d.ns matches ..0 unless score @s cs2d.money matches 300.. run tellraw @s [{"text": "金钱不足：烟雾弹 需要 $300", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.ns matches ..0 unless score @s cs2d.money matches 300.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
