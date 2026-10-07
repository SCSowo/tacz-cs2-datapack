# 加入 T（@s = 玩家）
team join T @s
tag @s remove cs2d.dead
execute if score #state cs2d.g matches 0 run gamemode adventure @s
execute if score #state cs2d.g matches 5 run gamemode adventure @s
tellraw @a [{"nbt":"Name","entity":"@s","color":"gold"},{"text":" 将作为T方开始游戏","color":"gray"}]
execute if score #state cs2d.g matches 1..4 run tellraw @s [{"text":"[CS2] ","color":"gold"},{"text":"下一回合开始生效，本回合先旁观","color":"gray"}]
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 2 1.2
execute at @s run function cs2d:spawn_home
