# 中断安放（@s = 玩家）
execute if entity @s[tag=cs2d.planting] run title @s actionbar {"text":"安放中断","color":"red"}
tag @s remove cs2d.planting
scoreboard players set @s cs2d.plt 0
bossbar set cs2d:plant visible false
bossbar set cs2d:plant players
