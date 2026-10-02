# 查看自己的本场战绩：/trigger cs2d.ctrl set 95
execute unless score @s cs2d.tk matches 0.. run scoreboard players set @s cs2d.tk 0
execute unless score @s cs2d.td matches 0.. run scoreboard players set @s cs2d.td 0
execute unless score @s cs2d.dmgv matches 0.. run scoreboard players set @s cs2d.dmgv 0
tellraw @s [{"text":"[CS2] ","color":"gold"},{"text":"本场战绩  ","color":"gray"},{"score":{"name":"*","objective":"cs2d.tk"},"color":"green","bold":true},{"text":" 杀  /  ","color":"gray"},{"score":{"name":"*","objective":"cs2d.td"},"color":"red","bold":true},{"text":" 死  ｜  伤害 ","color":"gray"},{"score":{"name":"*","objective":"cs2d.dmgv"},"color":"yellow","bold":true},{"text":"   （列表显示 ","color":"dark_gray"},{"score":{"name":"*","objective":"cs2d.kd"},"color":"dark_gray"},{"text":"）","color":"dark_gray"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 2 2
