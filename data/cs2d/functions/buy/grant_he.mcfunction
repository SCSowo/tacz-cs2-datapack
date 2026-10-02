# 兼容旧引用：按阵营转发
execute if entity @s[team=T] run function cs2d:buy/grant_he_t
execute if entity @s[team=CT] run function cs2d:buy/grant_he_ct
