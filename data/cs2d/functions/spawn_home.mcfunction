# 把 @s 送回本阵营出生点，并把个人重生点固定在那里（@s = 玩家）
# 关键：服务器开了 doImmediateRespawn=true，玩家一死会被立刻丢到世界出生点 /
#       旧重生点；只要每次死亡 / 回合开始 / 选队都刷一次 spawnpoint，就不会再跑偏。
execute if entity @s[team=T] if entity @e[type=marker,tag=cs2d.spawnT,limit=1] run tp @s @e[type=marker,tag=cs2d.spawnT,limit=1]
execute if entity @s[team=CT] if entity @e[type=marker,tag=cs2d.spawnCT,limit=1] run tp @s @e[type=marker,tag=cs2d.spawnCT,limit=1]
execute if entity @s[team=!] at @s run spawnpoint @s ~ ~ ~
