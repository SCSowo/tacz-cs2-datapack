function cs2d:zone_in_c
execute if score #zC cs2d.g matches 1 if score #in cs2d.g matches 0 if entity @e[type=marker,tag=cs2d.spawnCT,limit=1] run tp @s @e[type=marker,tag=cs2d.spawnCT,limit=1]
execute if score #zC cs2d.g matches 1 if score #in cs2d.g matches 0 run title @s actionbar {"text":"冻结时间不能离开出生区","color":"yellow"}
