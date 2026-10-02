# ===== 购买入口：先判购买窗口，再分发 =====
# 窗口 = 冻结期（state 1） 或 开局后 #buytime 秒（state 2，默认 20 秒）。

execute if score #state cs2d.g matches 1 run function cs2d:buy/go
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run function cs2d:buy/go
# 不在窗口内：只在真的点错时提示一次
execute unless score #state cs2d.g matches 1 unless score #state cs2d.g matches 2 run tellraw @s [{"text": "现在不是购买时间", "color": "red"}]
execute unless score #state cs2d.g matches 1 if score #state cs2d.g matches 2 unless score #buytime cs2d.g matches 1.. run tellraw @s [{"text": "购买时间已过（开局 20 秒后不能再买）", "color": "red"}]
scoreboard players enable @s cs2d.buy
