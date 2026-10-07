clear @s minecraft:redstone_block{cs2d_c4:1b} 1
scoreboard players set @s cs2d.c4 0
scoreboard players set #planted cs2d.g 1
scoreboard players set #bomb cs2d.g 40
scoreboard players set #beep cs2d.g 20
scoreboard players set #timer cs2d.g 40
scoreboard players add @a[team=T] cs2d.money 300
# 位置以安放者为准（调用方需 execute at @s）
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["cs2d.bomb"]}
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:["cs2d.bombfx"],item:{id:"minecraft:redstone_block",Count:1b},transformation:{translation:[0f,0.35f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f]}}
title @a title {"text":"炸弹已被安放，","color":"red","bold":true}
title @a subtitle [{"text":"距引爆还剩 ","color":"gray"},{"score":{"name":"#bomb","objective":"cs2d.g"},"color":"red","bold":true},{"text":" 秒。","color":"gray"}]
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 3 1.4
