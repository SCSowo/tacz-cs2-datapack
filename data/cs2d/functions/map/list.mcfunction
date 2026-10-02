# 列出所有已保存地图
execute store result score #n cs2d.g if entity @e[type=marker,tag=cs2d.map]
tellraw @a [{"text":"[CS2] 已保存地图：","color":"gold"},{"score":{"name":"#n","objective":"cs2d.g"},"color":"white"},{"text":" 张（当前槽位 ","color":"gray"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"white"},{"text":"）","color":"gray"}]
execute as @e[type=marker,tag=cs2d.map] run tellraw @a [{"text":"  [","color":"gray"},{"score":{"name":"@s","objective":"cs2d.mslot"},"color":"gold"},{"text":"] ","color":"gray"},{"nbt":"CustomName","entity":"@s","color":"yellow"}]
