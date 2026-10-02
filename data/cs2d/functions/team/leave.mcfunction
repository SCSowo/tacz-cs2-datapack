# 退出阵营 → 旁观（@s = 玩家）
team leave @s
clear @s
tag @s add cs2d.dead
execute if score #state cs2d.g matches 1..4 run gamemode spectator @s
execute unless score #state cs2d.g matches 1..4 run gamemode adventure @s
tellraw @a [{"nbt":"Name","entity":"@s","color":"gray"},{"text":" 退出了阵营（旁观）","color":"gray"}]
function cs2d:team/book
