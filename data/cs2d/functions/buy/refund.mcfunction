# ===== 退款：退还上一次购买 =====
# 只在购买窗口内可用（冻结期，或开局后 #buywin 秒内）—— 跟 CS2 一样，走出购买区就不能退了。
# 只退最近一次（cs2d.lb 记录商品码，cs2d.lbp 记录实付金额）。
# 触发方式：聊天栏「退款」按钮（/trigger cs2d.buy set 99）。

# --- 不在购买窗口 ---
execute unless score #state cs2d.g matches 1 unless score #state cs2d.g matches 2 run tellraw @s [{"text": "现在不能退款（只能在冻结期 / 开局后 20 秒内）", "color": "red"}]
execute unless score #state cs2d.g matches 1 unless score #state cs2d.g matches 2 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
# --- 开局后已过窗口 ---
execute if score #state cs2d.g matches 2 unless score #buytime cs2d.g matches 1.. run tellraw @s [{"text": "购买时间已过，无法退款", "color": "red"}]
execute if score #state cs2d.g matches 2 unless score #buytime cs2d.g matches 1.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
# --- 在窗口内但没有可退的东西 ---
execute if score #state cs2d.g matches 1 if score @s cs2d.lb matches ..0 run tellraw @s [{"text": "本回合还没有可退的购买", "color": "red"}]
execute if score #state cs2d.g matches 1 if score @s cs2d.lb matches ..0 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. if score @s cs2d.lb matches ..0 run tellraw @s [{"text": "本回合还没有可退的购买", "color": "red"}]
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. if score @s cs2d.lb matches ..0 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
# --- 执行退款 ---
execute if score #state cs2d.g matches 1 if score @s cs2d.lb matches 1.. run function cs2d:buy/refund_go
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. if score @s cs2d.lb matches 1.. run function cs2d:buy/refund_go
