# 每 tick：统计各阵营人数（选队菜单里动态显示）+ 每 20 秒给未选阵营的玩家补发选队菜单
execute store result score #t cs2d.tmp if entity @a[team=T]
execute store result score #c cs2d.tmp if entity @a[team=CT]
execute store result score #n cs2d.tmp if entity @a[team=]
# 选队菜单自动补发：聊天栏会滚上去，未选阵营的玩家每 20 秒（400 tick）重发一份
scoreboard players remove #tmenu cs2d.g 1
execute if score #tmenu cs2d.g matches ..0 run execute as @a[team=] run function cs2d:team/book
execute if score #tmenu cs2d.g matches ..0 run scoreboard players set #tmenu cs2d.g 400
