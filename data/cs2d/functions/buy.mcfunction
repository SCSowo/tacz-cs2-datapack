# ===== 购买入口：先判购买窗口，再分发 =====
# 窗口 = 冻结期（state 1） 或 开局后 #buytime 秒（state 2，默认 20 秒）。

execute if score #state cs2d.g matches 1 run function cs2d:buy/go
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run function cs2d:buy/go
# 不在窗口内：只提示「购买时间已过」（actionbar），其它失败反馈不显示
execute unless score #state cs2d.g matches 1 if score #state cs2d.g matches 2 unless score #buytime cs2d.g matches 1.. run title @s actionbar {"text":"购买时间已过","color":"red"}
scoreboard players enable @s cs2d.buy
