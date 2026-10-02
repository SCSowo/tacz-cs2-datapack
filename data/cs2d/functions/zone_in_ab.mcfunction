# @s 是否在包点（A 或 B）范围内 → #in 1/0
# 纯判定，不做任何提示、不触发下包
scoreboard players set #in cs2d.g 0
execute if score #zA cs2d.g matches 1 run function cs2d:zone_in_a
execute if score #in cs2d.g matches 0 if score #zB cs2d.g matches 1 run function cs2d:zone_in_b
