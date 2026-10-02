# ===== 购买分发（@s = 玩家，cs2d.buy = 商品编码）=====
# 购买窗口：冻结期（state 1）全程，或开局后 #buytime 秒内（默认 20 秒，改 #buywin）。
# 99 = 退款（退还上一次购买）。

# 99 = 退款：退还上一次购买（cs2d.lb 记录商品码，cs2d.lbp 记录实付）
execute if score @s cs2d.buy matches 99 run function cs2d:buy/refund

execute if score @s cs2d.buy matches 13 run function cs2d:buy/mac10
execute if score @s cs2d.buy matches 14 run function cs2d:buy/mp9
execute if score @s cs2d.buy matches 15 run function cs2d:buy/galil
execute if score @s cs2d.buy matches 16 run function cs2d:buy/ak47
execute if score @s cs2d.buy matches 17 run function cs2d:buy/m4a4
execute if score @s cs2d.buy matches 18 run function cs2d:buy/awp
execute if score @s cs2d.buy matches 19 run function cs2d:buy/mag7
execute if score @s cs2d.buy matches 12 run function cs2d:buy/deagle
execute if score @s cs2d.buy matches 10 run function cs2d:buy/usp
execute if score @s cs2d.buy matches 11 run function cs2d:buy/glock
execute if score @s cs2d.buy matches 20 run function cs2d:buy/flash
execute if score @s cs2d.buy matches 21 run function cs2d:buy/he
execute if score @s cs2d.buy matches 22 run function cs2d:buy/smoke
execute if score @s cs2d.buy matches 23 run function cs2d:buy/molotov
execute if score @s cs2d.buy matches 50 run function cs2d:buy/kevlar
execute if score @s cs2d.buy matches 51 run function cs2d:buy/helmet
execute if score @s cs2d.buy matches 52 run function cs2d:buy/kit
# 98 = 重新发一份菜单（聊天栏会滚上去，翻不到时可以再要一份）
execute if score @s cs2d.buy matches 98 run function cs2d:buy_menu

# ===== fix22：新增枪械 =====
execute if score @s cs2d.buy matches 24 run function cs2d:buy/sg553
execute if score @s cs2d.buy matches 25 run function cs2d:buy/aug
execute if score @s cs2d.buy matches 26 run function cs2d:buy/famas
execute if score @s cs2d.buy matches 27 run function cs2d:buy/ssg08
execute if score @s cs2d.buy matches 28 run function cs2d:buy/scar20
execute if score @s cs2d.buy matches 29 run function cs2d:buy/g3sg1
execute if score @s cs2d.buy matches 30 run function cs2d:buy/m4a1s
execute if score @s cs2d.buy matches 31 run function cs2d:buy/mp5sd
execute if score @s cs2d.buy matches 32 run function cs2d:buy/ump45
execute if score @s cs2d.buy matches 33 run function cs2d:buy/p90
execute if score @s cs2d.buy matches 34 run function cs2d:buy/bizon
execute if score @s cs2d.buy matches 35 run function cs2d:buy/nova
execute if score @s cs2d.buy matches 36 run function cs2d:buy/xm1014
execute if score @s cs2d.buy matches 37 run function cs2d:buy/sawedoff
execute if score @s cs2d.buy matches 38 run function cs2d:buy/m249
execute if score @s cs2d.buy matches 39 run function cs2d:buy/negev
execute if score @s cs2d.buy matches 40 run function cs2d:buy/p250
execute if score @s cs2d.buy matches 41 run function cs2d:buy/fiveseven
execute if score @s cs2d.buy matches 42 run function cs2d:buy/tec9
execute if score @s cs2d.buy matches 43 run function cs2d:buy/cz75
execute if score @s cs2d.buy matches 44 run function cs2d:buy/dual
execute if score @s cs2d.buy matches 45 run function cs2d:buy/r8
