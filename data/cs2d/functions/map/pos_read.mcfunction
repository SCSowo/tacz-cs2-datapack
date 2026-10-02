# 读取执行位置 → #px #py #pz（玩家/console/execute positioned 都能用）
summon minecraft:marker ~ ~ ~ {Tags:["cs2d.rdmk"]}
execute store result score #px cs2d.g run data get entity @e[type=marker,tag=cs2d.rdmk,limit=1] Pos[0]
execute store result score #py cs2d.g run data get entity @e[type=marker,tag=cs2d.rdmk,limit=1] Pos[1]
execute store result score #pz cs2d.g run data get entity @e[type=marker,tag=cs2d.rdmk,limit=1] Pos[2]
kill @e[type=marker,tag=cs2d.rdmk]
