# ===== 退款分发（@s = 玩家，已确定在窗口内且 lb>=1）=====
# 主武器 / 手枪
execute if score @s cs2d.lb matches 13 run function cs2d:buy/un_mac10
execute if score @s cs2d.lb matches 14 run function cs2d:buy/un_mp9
execute if score @s cs2d.lb matches 15 run function cs2d:buy/un_galil
execute if score @s cs2d.lb matches 16 run function cs2d:buy/un_ak47
execute if score @s cs2d.lb matches 17 run function cs2d:buy/un_m4a4
execute if score @s cs2d.lb matches 18 run function cs2d:buy/un_awp
execute if score @s cs2d.lb matches 19 run function cs2d:buy/un_mag7
execute if score @s cs2d.lb matches 12 run function cs2d:buy/un_deagle
execute if score @s cs2d.lb matches 10 run function cs2d:buy/un_usp
execute if score @s cs2d.lb matches 11 run function cs2d:buy/un_glock
# 投掷物（按阵营分别退款，价格 T/CT 不同）
execute if score @s cs2d.lb matches 20 if entity @s[team=T] run function cs2d:buy/un_flash_t
execute if score @s cs2d.lb matches 20 if entity @s[team=CT] run function cs2d:buy/un_flash_ct
execute if score @s cs2d.lb matches 21 if entity @s[team=T] run function cs2d:buy/un_he_t
execute if score @s cs2d.lb matches 21 if entity @s[team=CT] run function cs2d:buy/un_he_ct
execute if score @s cs2d.lb matches 22 if entity @s[team=T] run function cs2d:buy/un_smoke_t
execute if score @s cs2d.lb matches 22 if entity @s[team=CT] run function cs2d:buy/un_smoke_ct
execute if score @s cs2d.lb matches 23 if entity @s[team=T] run function cs2d:buy/un_molotov_t
execute if score @s cs2d.lb matches 23 if entity @s[team=CT] run function cs2d:buy/un_molotov_ct
# 装备
execute if score @s cs2d.lb matches 50 run function cs2d:buy/un_kevlar
execute if score @s cs2d.lb matches 51 if score @s cs2d.lbp matches 1000 run function cs2d:buy/un_armor2
execute if score @s cs2d.lb matches 51 if score @s cs2d.lbp matches 350 run function cs2d:buy/un_helmet
execute if score @s cs2d.lb matches 52 run function cs2d:buy/un_kit
# 退款后不超过金钱上限 $16000
execute if score @s cs2d.money matches 16001.. run scoreboard players set @s cs2d.money 16000

# ===== fix22：新增枪械 =====
execute if score @s cs2d.lb matches 24 run function cs2d:buy/un_sg553
execute if score @s cs2d.lb matches 25 run function cs2d:buy/un_aug
execute if score @s cs2d.lb matches 26 run function cs2d:buy/un_famas
execute if score @s cs2d.lb matches 27 run function cs2d:buy/un_ssg08
execute if score @s cs2d.lb matches 28 run function cs2d:buy/un_scar20
execute if score @s cs2d.lb matches 29 run function cs2d:buy/un_g3sg1
execute if score @s cs2d.lb matches 30 run function cs2d:buy/un_m4a1s
execute if score @s cs2d.lb matches 31 run function cs2d:buy/un_mp5sd
execute if score @s cs2d.lb matches 32 run function cs2d:buy/un_ump45
execute if score @s cs2d.lb matches 33 run function cs2d:buy/un_p90
execute if score @s cs2d.lb matches 34 run function cs2d:buy/un_bizon
execute if score @s cs2d.lb matches 35 run function cs2d:buy/un_nova
execute if score @s cs2d.lb matches 36 run function cs2d:buy/un_xm1014
execute if score @s cs2d.lb matches 37 run function cs2d:buy/un_sawedoff
execute if score @s cs2d.lb matches 38 run function cs2d:buy/un_m249
execute if score @s cs2d.lb matches 39 run function cs2d:buy/un_negev
execute if score @s cs2d.lb matches 40 run function cs2d:buy/un_p250
execute if score @s cs2d.lb matches 41 run function cs2d:buy/un_fiveseven
execute if score @s cs2d.lb matches 42 run function cs2d:buy/un_tec9
execute if score @s cs2d.lb matches 43 run function cs2d:buy/un_cz75
execute if score @s cs2d.lb matches 44 run function cs2d:buy/un_dual
execute if score @s cs2d.lb matches 45 run function cs2d:buy/un_r8
