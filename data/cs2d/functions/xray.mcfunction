# ===== 队友 X 光（cs2d:xray）=====
# 已选阵营 + 存活（非旁观）的玩家带队伍色发光轮廓，穿墙可见：CT 蓝 / T 金。
#
# 引擎限制（重要）：Minecraft 的 glowing 是"实体状态"，客户端对**所有**观察者都会渲染轮廓，
# 队伍只能控制名字牌可见性和"能否看穿隐身队友"，没有"只对本队渲染"的接口。
# 所以严格意义上的"只有同队看得到"在 1.20.1 原版做不到 —— 敌方同样会看到轮廓。
# 不想要就关掉：/scoreboard players set #xray cs2d.g 0   或   /trigger cs2d.ctrl set 97
execute if score #xray cs2d.g matches 1 run effect give @a[team=CT,gamemode=!spectator] minecraft:glowing 3 0 true
execute if score #xray cs2d.g matches 1 run effect give @a[team=T,gamemode=!spectator] minecraft:glowing 3 0 true
# 关掉时清一次；开着时故意不清，避免每秒 clear+give 造成轮廓闪烁
# （死亡走 death.mcfunction 的 effect clear @s，强制停止走 stop.mcfunction 的 effect clear @a）
execute unless score #xray cs2d.g matches 1 run effect clear @a minecraft:glowing
