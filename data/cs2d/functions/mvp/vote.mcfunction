# 逐个比较，击杀数更高者抢走 MVP 标记
execute if score @s cs2d.kills > #mvpk cs2d.g run tag @a remove cs2d.mvp
execute if score @s cs2d.kills > #mvpk cs2d.g run tag @s add cs2d.mvp
execute if score @s cs2d.kills > #mvpk cs2d.g run scoreboard players operation #mvpk cs2d.g = @s cs2d.kills
