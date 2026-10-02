# 购买 闪光弹  $200（每类道具各 1 个）
execute if score @s cs2d.nf matches 1.. run tellraw @s [{"text": "闪光弹 已达上限（1 个）", "color": "red"}]
execute if score @s cs2d.nf matches 2.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.nf matches ..0 if score @s cs2d.money matches 200.. run function cs2d:buy/grant_flash_t
execute if entity @s[team=T] if score @s cs2d.nf matches ..0 unless score @s cs2d.money matches 200.. run tellraw @s [{"text": "金钱不足：闪光弹 需要 $200", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.nf matches ..0 unless score @s cs2d.money matches 200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.nf matches ..0 if score @s cs2d.money matches 200.. run function cs2d:buy/grant_flash_ct
execute if entity @s[team=CT] if score @s cs2d.nf matches ..0 unless score @s cs2d.money matches 200.. run tellraw @s [{"text": "金钱不足：闪光弹 需要 $200", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.nf matches ..0 unless score @s cs2d.money matches 200.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
