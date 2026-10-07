# 回合结算（#w: 1=T 2=CT；#reason: 1歼灭 2爆炸 3拆除 4时间到）
scoreboard players set #buytime cs2d.g 0
scoreboard players set #state cs2d.g 3
# 中断所有进行中的安放
tag @a remove cs2d.planting
effect clear @a minecraft:slowness
scoreboard players set @a cs2d.plt 0
bossbar set cs2d:plant visible false
bossbar set cs2d:plant players
scoreboard players set #timer cs2d.g 5
# --- 先算经济（#planted 此时仍是本回合的值）---
# 比分
execute if score #w cs2d.g matches 1 run scoreboard players add T cs2d.wins 1
execute if score #w cs2d.g matches 2 run scoreboard players add CT cs2d.wins 1
# 胜方 +$3250，己方连败计数清零，对方连败 +1
execute if score #w cs2d.g matches 1 run scoreboard players add @a[team=T] cs2d.money 3250
execute if score #w cs2d.g matches 1 run scoreboard players set #lossT cs2d.g 0
execute if score #w cs2d.g matches 1 run scoreboard players add #lossCT cs2d.g 1
execute if score #w cs2d.g matches 2 run scoreboard players add @a[team=CT] cs2d.money 3250
execute if score #w cs2d.g matches 2 run scoreboard players set #lossCT cs2d.g 0
execute if score #w cs2d.g matches 2 run scoreboard players add #lossT cs2d.g 1
# 败方连败补偿（$1400 / 1900 / 2400 / 2900 / 3400）
execute if score #w cs2d.g matches 1 run function cs2d:econ/loss_ct
execute if score #w cs2d.g matches 2 run function cs2d:econ/loss_t
# T 输掉但本回合安放过炸弹：额外 +$800
execute if score #w cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players add @a[team=T] cs2d.money 800
# 金钱上限 $16000
execute as @a if score @s cs2d.money matches 16001.. run scoreboard players set @s cs2d.money 16000
# --- MVP ---
function cs2d:mvp/elect
# --- 清场 ---
scoreboard players set #planted cs2d.g 0
scoreboard players set #bomb cs2d.g 0
kill @e[type=marker,tag=cs2d.bomb]
kill @e[type=item_display,tag=cs2d.bombfx]
tag @a remove cs2d.defusing
clear @a minecraft:redstone_block{cs2d_c4:1b}
kill @e[type=item,nbt={Item:{tag:{cs2d_s:0b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:1b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:2b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:3b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:4b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:5b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:6b}}}]
kill @e[type=item,nbt={Item:{tag:{cs2d_s:7b}}}]
kill @e[type=marker,tag=cs2d.c4drop]
kill @e[type=item,tag=cs2d.c4drop]
kill @e[type=block_display,tag=cs2d.c4fx]
kill @e[type=item,nbt={Item:{tag:{cs2d_c4:1b}}}]
kill @e[type=item,tag=cs2d.wdrop]
kill @e[type=item,tag=cs2d.wdnew]
bossbar set cs2d:defuse visible false
bossbar set cs2d:defuse players
# --- 公告 ---
execute if score #w cs2d.g matches 1 run title @a title {"text":"恐怖分子获胜","color":"gold","bold":true}
execute if score #w cs2d.g matches 2 run title @a title {"text":"反恐精英获胜","color":"blue","bold":true}
execute if score #w cs2d.g matches 1 run playsound minecraft:entity.player.levelup master @a[team=T] ~ ~ ~ 2 1.2
execute if score #w cs2d.g matches 2 run playsound minecraft:entity.player.levelup master @a[team=CT] ~ ~ ~ 2 1.2
execute if score #w cs2d.g matches 1 run playsound minecraft:block.note_block.bass master @a[team=CT] ~ ~ ~ 2 0.8
execute if score #w cs2d.g matches 2 run playsound minecraft:block.note_block.bass master @a[team=T] ~ ~ ~ 2 0.8
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2 1
