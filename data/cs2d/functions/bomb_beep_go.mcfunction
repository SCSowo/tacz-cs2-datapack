# 响一声，然后按剩余时间决定下次间隔（剩得越少间隔越短、音调越高）
execute if score #bomb cs2d.g matches 21.. at @e[type=marker,tag=cs2d.bomb] run playsound minecraft:block.note_block.hat master @a[distance=..70] ~ ~ ~ 3 1
execute if score #bomb cs2d.g matches 11..20 at @e[type=marker,tag=cs2d.bomb] run playsound minecraft:block.note_block.hat master @a[distance=..70] ~ ~ ~ 3 1.2
execute if score #bomb cs2d.g matches 6..10 at @e[type=marker,tag=cs2d.bomb] run playsound minecraft:block.note_block.hat master @a[distance=..70] ~ ~ ~ 3 1.5
execute if score #bomb cs2d.g matches 1..5 at @e[type=marker,tag=cs2d.bomb] run playsound minecraft:block.note_block.hat master @a[distance=..70] ~ ~ ~ 3 1.9
execute if score #bomb cs2d.g matches 21.. run scoreboard players set #beep cs2d.g 20
execute if score #bomb cs2d.g matches 11..20 run scoreboard players set #beep cs2d.g 10
execute if score #bomb cs2d.g matches 6..10 run scoreboard players set #beep cs2d.g 5
execute if score #bomb cs2d.g matches 1..5 run scoreboard players set #beep cs2d.g 3
