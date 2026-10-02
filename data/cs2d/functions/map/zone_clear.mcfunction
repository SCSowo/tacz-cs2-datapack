kill @e[type=block_display,tag=cs2d.fx]
scoreboard players set #hasp1 cs2d.g 0
kill @e[type=text_display,tag=cs2d.fx]
tellraw @a {"text":"[CS2] 已清除区域高光（区域坐标保留）","color":"green"}
