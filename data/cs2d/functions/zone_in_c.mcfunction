# @s 是否在 #zC 区域内 → #in (1/0)
scoreboard players set #in cs2d.g 0
execute if score #zC cs2d.g matches 1 run function cs2d:zone_read_pos
execute if score #zC cs2d.g matches 1 if score #px cs2d.g >= #cx1 cs2d.g if score #px cs2d.g <= #cx2 cs2d.g if score #py cs2d.g >= #cy1 cs2d.g if score #py cs2d.g <= #cy2 cs2d.g if score #pz cs2d.g >= #cz1 cs2d.g if score #pz cs2d.g <= #cz2 cs2d.g run scoreboard players set #in cs2d.g 1
