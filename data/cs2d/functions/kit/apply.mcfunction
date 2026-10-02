# 按计分板记录发放全部装备（@s = 玩家）
clear @s
# --- 主武器 ---
execute if score @s cs2d.w1 matches 1 run function cs2d:gun/mac10
execute if score @s cs2d.w1 matches 2 run function cs2d:gun/mp9
execute if score @s cs2d.w1 matches 3 run function cs2d:gun/galil
execute if score @s cs2d.w1 matches 4 run function cs2d:gun/ak47
execute if score @s cs2d.w1 matches 5 run function cs2d:gun/m4a4
execute if score @s cs2d.w1 matches 6 run function cs2d:gun/awp
execute if score @s cs2d.w1 matches 7 run function cs2d:gun/mag7
# --- 副武器（0 = 各阵营默认手枪）---
execute if score @s cs2d.w2 matches 0 if entity @s[team=T] run function cs2d:gun/glock
execute if score @s cs2d.w2 matches 0 if entity @s[team=CT] run function cs2d:gun/usp
execute if score @s cs2d.w2 matches 2 run function cs2d:gun/deagle
# --- 近战 ---
function cs2d:knife
# --- 护甲（用属性，不占装备栏）---
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000001
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000002
execute if score @s cs2d.arm matches 1.. run attribute @s minecraft:generic.armor modifier add aaaaaaaa-0000-0000-0000-000000000001 cs2d_kevlar 8 add
execute if score @s cs2d.arm matches 2 run attribute @s minecraft:generic.armor modifier add aaaaaaaa-0000-0000-0000-000000000002 cs2d_helmet 4 add
# --- 投掷物 ---
execute if score @s cs2d.nf matches 1 run item replace entity @s hotbar.3 with lrtactical:throwable{ThrowableId:"lrtactical:flash_grenade",cs2d_s:3b} 1
execute if score @s cs2d.nh matches 1 run item replace entity @s hotbar.4 with lrtactical:throwable{ThrowableId:"lrtactical:m67",cs2d_s:4b} 1
execute if score @s cs2d.ns matches 1 run item replace entity @s hotbar.5 with lrtactical:throwable{ThrowableId:"lrtactical:smoke_grenade",cs2d_s:5b} 1
execute if score @s cs2d.nm matches 1 run item replace entity @s hotbar.6 with lrtactical:throwable{ThrowableId:"lrtactical:molotov",cs2d_s:6b} 1
# --- 拆弹钳（仅 CT）---
# 拆弹钳不占格子（见 grant_kit）：只记 cs2d.kit

# --- fix22：新增主武器 ---
execute if score @s cs2d.w1 matches 8 run function cs2d:gun/sg553
execute if score @s cs2d.w1 matches 9 run function cs2d:gun/aug
execute if score @s cs2d.w1 matches 10 run function cs2d:gun/famas
execute if score @s cs2d.w1 matches 11 run function cs2d:gun/ssg08
execute if score @s cs2d.w1 matches 12 run function cs2d:gun/scar20
execute if score @s cs2d.w1 matches 13 run function cs2d:gun/g3sg1
execute if score @s cs2d.w1 matches 14 run function cs2d:gun/m4a1s
execute if score @s cs2d.w1 matches 15 run function cs2d:gun/mp5sd
execute if score @s cs2d.w1 matches 16 run function cs2d:gun/ump45
execute if score @s cs2d.w1 matches 17 run function cs2d:gun/p90
execute if score @s cs2d.w1 matches 18 run function cs2d:gun/bizon
execute if score @s cs2d.w1 matches 19 run function cs2d:gun/nova
execute if score @s cs2d.w1 matches 20 run function cs2d:gun/xm1014
execute if score @s cs2d.w1 matches 21 run function cs2d:gun/sawedoff
execute if score @s cs2d.w1 matches 22 run function cs2d:gun/m249
execute if score @s cs2d.w1 matches 23 run function cs2d:gun/negev
# --- fix22：新增手枪 ---
execute if score @s cs2d.w2 matches 3 run function cs2d:gun/p250
execute if score @s cs2d.w2 matches 4 run function cs2d:gun/fiveseven
execute if score @s cs2d.w2 matches 5 run function cs2d:gun/tec9
execute if score @s cs2d.w2 matches 6 run function cs2d:gun/cz75
execute if score @s cs2d.w2 matches 7 run function cs2d:gun/dual
execute if score @s cs2d.w2 matches 8 run function cs2d:gun/r8
