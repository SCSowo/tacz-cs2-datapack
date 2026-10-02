# 读取 @s 坐标 → #px #py #pz
execute store result score #px cs2d.g run data get entity @s Pos[0]
execute store result score #py cs2d.g run data get entity @s Pos[1]
execute store result score #pz cs2d.g run data get entity @s Pos[2]
