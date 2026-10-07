# 回合开始：冻结 / 购买阶段（CS2 = 15 秒）
scoreboard players set #state cs2d.g 1
scoreboard players set #timer cs2d.g 15
scoreboard players set #buytime cs2d.g 0
scoreboard players set @a cs2d.lb 0
scoreboard players set @a cs2d.lbp 0
scoreboard players set #planted cs2d.g 0
scoreboard players set #bomb cs2d.g 0
scoreboard players set #reason cs2d.g 1
scoreboard players add #round cs2d.g 1
# 常规赛半场：打满 #halfr 回合（默认 12）后换边 —— 用 > 而不是 == ，
# 即使某回合 #round 被跳过也不会漏掉换边
execute if score #ot cs2d.g matches 0 if score #half cs2d.g matches 0 if score #round cs2d.g > #halfr cs2d.g run function cs2d:swap_sides
# 加时赛：每 #oth 回合（默认 3）换一次边
execute if score #ot cs2d.g matches 1 run function cs2d:ot_swap
# 全体复活 + 按记录发装备（存活者保留上回合装备）
# 已选阵营的 → 复活发装备；没选阵营的 → 旁观
execute as @a[team=!] at @s run function cs2d:player_reset
execute as @a[team=] run gamemode spectator @s
execute as @a[team=] run tag @s add cs2d.dead
# 出生点传送
execute as @a[team=!] at @s run function cs2d:spawn_home
# 随机一名 T 携带 C4
kill @e[type=marker,tag=cs2d.c4drop]
kill @e[type=item,tag=cs2d.c4drop]
kill @e[type=block_display,tag=cs2d.c4fx]
kill @e[type=item,nbt={Item:{tag:{cs2d_c4:1b}}}]
# 兜底：清掉上一回合（含炸弹爆炸后延迟掉落）残留的武器/投掷物掉落
kill @e[type=item,tag=cs2d.wdrop]
kill @e[type=item,tag=cs2d.wdnew]
clear @a minecraft:redstone_block{cs2d_c4:1b}
# 固定第 8 格（hotbar.7）：主武器 1 / 手枪 2 / 刀 3 / 道具 4~7，谁都碰不到它
execute if entity @a[team=T,gamemode=!spectator] run item replace entity @r[team=T,gamemode=!spectator] hotbar.7 with minecraft:redstone_block{cs2d_c4:1b,cs2d_s:7b,display:{Name:'{"text":"C4 炸弹","color":"red","italic":false}',Lore:['{"text":"站在包点内按住潜行（Shift）3.25 秒安放","color":"gray","italic":false}','{"text":"移动或松开蹲会中断","color":"dark_gray","italic":false}','{"text":"爆炸倒计时 40 秒","color":"dark_gray","italic":false}']}} 1
# 告诉 T 谁带包（clear 0 = 只统计不移除）
execute as @a[team=T,gamemode=!spectator] store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0
execute as @a[team=T,gamemode=!spectator] if score @s cs2d.c4 matches 1.. run playsound minecraft:block.note_block.pling player @s ~ ~ ~ 2 1.2
execute as @a[team=CT,gamemode=!spectator] run scoreboard players set @s cs2d.c4 0
# 兜底：万一没人拿到 C4（背包满了会掉在地上），明确报警
execute if entity @a[team=T,gamemode=!spectator] unless entity @a[team=T,gamemode=!spectator,scores={cs2d.c4=1..}] run tellraw @a [{"text":"[CS2] 警告：C4 没进任何 T 的背包（背包满会掉地上）—— 捡起来才能安放","color":"red"}]
# 清掉上一回合残留的安放状态
tag @a remove cs2d.planting
scoreboard players set @a cs2d.plt 0
bossbar set cs2d:plant visible false
bossbar set cs2d:plant players
bossbar set cs2d:defuse visible false
bossbar set cs2d:defuse players
tag @a remove cs2d.defusing
# 发购买菜单
execute as @a[team=!] run function cs2d:buy_menu
# 开局自动打开：书塞主手（右键即开）+ 聊天栏快捷按钮
scoreboard players enable @a cs2d.buy
scoreboard players enable @a cs2d.plant
scoreboard players enable @a cs2d.defl
# 记录双方存活人数（全灭判定）
execute store result score #talive cs2d.g if entity @a[team=T,gamemode=!spectator]
execute store result score #calive cs2d.g if entity @a[team=CT,gamemode=!spectator]
# 本回合击杀数清零（MVP 统计用）
scoreboard players set @a cs2d.kills 0
title @a title [{"text":"回合 ","color":"yellow"},{"score":{"name":"#round","objective":"cs2d.g"},"color":"white","bold":true}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1.5
