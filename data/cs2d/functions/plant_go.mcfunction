# 开始安放（@s = 玩家）
tag @s add cs2d.planting
scoreboard players set @s cs2d.plt 0
scoreboard players operation @s cs2d.mv0 = @s cs2d.mv
execute store result bossbar cs2d:plant max run scoreboard players get #plantt cs2d.g
bossbar set cs2d:plant value 0
bossbar set cs2d:plant players @s
bossbar set cs2d:plant visible true
title @s actionbar {"text":"安放中… 保持蹲着别动","color":"red"}
playsound minecraft:block.note_block.bass master @a ~ ~ ~ 2 0.8
