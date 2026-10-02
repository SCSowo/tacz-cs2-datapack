# 购买 燃烧瓶 $400（T）/ 燃烧弹 $600（CT），最多 1 个
execute if score @s cs2d.nm matches 1.. run tellraw @s [{"text": "燃烧瓶 已达上限（1 个）", "color": "red"}]
execute if score @s cs2d.nm matches 1.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.nm matches ..0 if score @s cs2d.money matches 400.. run function cs2d:buy/grant_molotov_t
execute if entity @s[team=T] if score @s cs2d.nm matches ..0 unless score @s cs2d.money matches 400.. run tellraw @s [{"text": "金钱不足：燃烧瓶 需要 $400", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.nm matches ..0 unless score @s cs2d.money matches 400.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.nm matches ..0 if score @s cs2d.money matches 600.. run function cs2d:buy/grant_molotov_ct
execute if entity @s[team=CT] if score @s cs2d.nm matches ..0 unless score @s cs2d.money matches 600.. run tellraw @s [{"text": "金钱不足：燃烧弹 需要 $600", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.nm matches ..0 unless score @s cs2d.money matches 600.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
