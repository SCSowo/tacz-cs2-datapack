# 在死亡原地生成一个锁定掉落物（@s = 死者；storage cs2d:tmp wditem 已放好物品）
data modify storage cs2d:tmp deathpos set value [0.0, 0.0, 0.0]
execute store result storage cs2d:tmp deathpos[0] double 1 run scoreboard players get @s cs2d.lx
execute store result storage cs2d:tmp deathpos[1] double 1 run scoreboard players get @s cs2d.ly
execute store result storage cs2d:tmp deathpos[2] double 1 run scoreboard players get @s cs2d.lz
execute at @s run summon minecraft:item ~ ~ ~ {Tags:["cs2d.wdnew"],PickupDelay:32767s,Age:-32768s}
data modify entity @e[type=item,tag=cs2d.wdnew,limit=1] Pos set from storage cs2d:tmp deathpos
data modify entity @e[type=item,tag=cs2d.wdnew,limit=1] Item set from storage cs2d:tmp wditem
tag @e[type=item,tag=cs2d.wdnew] add cs2d.wdrop
tag @e[type=item,tag=cs2d.wdnew] remove cs2d.wdnew
