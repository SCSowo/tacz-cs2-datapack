# 选择当前地图槽位
scoreboard players operation #slot cs2d.g = @s cs2d.slot
tellraw @a [{"text":"[CS2] 当前地图槽位 → ","color":"gold"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"white"}]
scoreboard players enable @s cs2d.slot
