# @s 是否在 #zB 区域内 → #in (1/0)
scoreboard players set #in cs2d.g 0
execute if score #zB cs2d.g matches 1 run function cs2d:zone_read_pos
execute if score #zB cs2d.g matches 1 if score #px cs2d.g >= #bx1 cs2d.g if score #px cs2d.g <= #bx2 cs2d.g if score #py cs2d.g >= #by1 cs2d.g if score #py cs2d.g <= #by2 cs2d.g if score #pz cs2d.g >= #bz1 cs2d.g if score #pz cs2d.g <= #bz2 cs2d.g run scoreboard players set #in cs2d.g 1
