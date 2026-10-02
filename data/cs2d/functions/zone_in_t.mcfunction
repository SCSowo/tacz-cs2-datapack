# @s 是否在 #zT 区域内 → #in (1/0)
scoreboard players set #in cs2d.g 0
execute if score #zT cs2d.g matches 1 run function cs2d:zone_read_pos
execute if score #zT cs2d.g matches 1 if score #px cs2d.g >= #tx1 cs2d.g if score #px cs2d.g <= #tx2 cs2d.g if score #py cs2d.g >= #ty1 cs2d.g if score #py cs2d.g <= #ty2 cs2d.g if score #pz cs2d.g >= #tz1 cs2d.g if score #pz cs2d.g <= #tz2 cs2d.g run scoreboard players set #in cs2d.g 1
