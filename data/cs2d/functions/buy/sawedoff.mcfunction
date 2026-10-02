# 购买 截短霰弹枪  $1100（T）
execute unless entity @s[team=T] run tellraw @s [{"text": "截短霰弹枪 仅限 T 阵营", "color": "red"}]
execute unless entity @s[team=T] run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] if score @s cs2d.w1 matches 21 run tellraw @s [{"text": "你已持有 截短霰弹枪", "color": "red"}]
execute if entity @s[team=T] if score @s cs2d.w1 matches 21 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if entity @s[team=T] unless score @s cs2d.w1 matches 21 if score @s cs2d.money matches 1100.. run function cs2d:buy/grant_sawedoff
execute if entity @s[team=T] unless score @s cs2d.w1 matches 21 unless score @s cs2d.money matches 1100.. run tellraw @s [{"text": "金钱不足：截短霰弹枪 需要 $1100", "color": "red"}]
execute if entity @s[team=T] unless score @s cs2d.w1 matches 21 unless score @s cs2d.money matches 1100.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
