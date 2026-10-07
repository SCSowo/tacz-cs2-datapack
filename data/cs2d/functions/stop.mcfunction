# 强制停止：立即中止当前回合/比赛，且不会再自动开始
scoreboard players set #buytime cs2d.g 0
scoreboard players set #state cs2d.g 5
scoreboard players set #planted cs2d.g 0
scoreboard players set #bomb cs2d.g 0
scoreboard players set #round cs2d.g 0
scoreboard players set #reason cs2d.g 1
# 清场
kill @e[type=marker,tag=cs2d.bomb]
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
kill @e[type=item_display,tag=cs2d.bombfx]
tag @a remove cs2d.defusing
tag @a remove cs2d.planting
scoreboard players set @a cs2d.plt 0
bossbar set cs2d:plant visible false
bossbar set cs2d:plant players
tag @a remove cs2d.dead
bossbar set cs2d:defuse visible false
bossbar set cs2d:defuse players
clear @a
# 玩家复位
gamemode adventure @a
effect clear @a
execute as @a at @s run tp @s ~ ~ ~
scoreboard players set @a cs2d.money 0
scoreboard players set @a cs2d.kit 0
scoreboard players set @a cs2d.def 0
scoreboard players set @a cs2d.w1 0
scoreboard players set @a cs2d.w1p 0
scoreboard players set @a cs2d.w2 0
scoreboard players set @a cs2d.w2p 0
scoreboard players set @a cs2d.nf 0
scoreboard players set @a cs2d.nh 0
scoreboard players set @a cs2d.ns 0
scoreboard players set @a cs2d.nm 0
scoreboard players set @a cs2d.arm 0
scoreboard players set @a cs2d.kills 0
execute as @a run attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000001
execute as @a run attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000002
scoreboard players set #half cs2d.g 0
scoreboard players set #ot cs2d.g 0
scoreboard players set #otbase cs2d.g 0
scoreboard players set #lossT cs2d.g 0
scoreboard players set #lossCT cs2d.g 0
scoreboard players set @a cs2d.buy 0
scoreboard players set @a cs2d.plant 0
scoreboard players set @a cs2d.defl 0
scoreboard players set T cs2d.wins 0
scoreboard players set CT cs2d.wins 0
# 公告
title @a title {"text":"已强制停止","color":"red","bold":true}
playsound minecraft:block.note_block.bass master @a ~ ~ ~ 2 1
