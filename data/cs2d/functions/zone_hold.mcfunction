# 冻结阶段：把离开自家区域的玩家拉回
execute as @a[team=T,gamemode=!spectator] at @s run function cs2d:zone_hold_t
execute as @a[team=CT,gamemode=!spectator] at @s run function cs2d:zone_hold_c
