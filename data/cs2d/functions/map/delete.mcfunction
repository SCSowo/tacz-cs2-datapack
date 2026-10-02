# 删除槽位 #slot 的地图记录
scoreboard players set #found cs2d.g 0
execute as @e[type=marker,tag=cs2d.map] if score @s cs2d.mslot = #slot cs2d.g run scoreboard players set #found cs2d.g 1
execute as @e[type=marker,tag=cs2d.map] if score @s cs2d.mslot = #slot cs2d.g run kill @s
execute if score #found cs2d.g matches 0 run tellraw @a [{"text":"[CS2] 槽位 ","color":"red"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"white"},{"text":" 本来就是空的","color":"red"}]
execute if score #found cs2d.g matches 1 run tellraw @a [{"text":"[CS2] 槽位 ","color":"green"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"gold"},{"text":" 已删除","color":"green"}]
