# 拆弹钳  $400（仅 CT）
execute unless entity @s[team=CT] run tellraw @s [{"text": "拆弹钳仅限 CT 阵营购买", "color": "red"}]
execute unless entity @s[team=CT] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.kit matches 1.. run tellraw @s [{"text": "你已有拆弹钳", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.kit matches 1.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=CT] if score @s cs2d.kit matches 0 if score @s cs2d.money matches 400.. run function cs2d:buy/grant_kit
execute if entity @s[team=CT] if score @s cs2d.kit matches 0 unless score @s cs2d.money matches 400.. run tellraw @s [{"text": "金钱不足：拆弹钳 需要 $400", "color": "red"}]
execute if entity @s[team=CT] if score @s cs2d.kit matches 0 unless score @s cs2d.money matches 400.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
