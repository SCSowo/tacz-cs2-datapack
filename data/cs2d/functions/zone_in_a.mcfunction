# @s 是否在 #zA 区域内 → #in (1/0)
scoreboard players set #in cs2d.g 0
execute if score #zA cs2d.g matches 1 run function cs2d:zone_read_pos
execute if score #zA cs2d.g matches 1 if score #px cs2d.g >= #ax1 cs2d.g if score #px cs2d.g <= #ax2 cs2d.g if score #py cs2d.g >= #ay1 cs2d.g if score #py cs2d.g <= #ay2 cs2d.g if score #pz cs2d.g >= #az1 cs2d.g if score #pz cs2d.g <= #az2 cs2d.g run scoreboard players set #in cs2d.g 1
