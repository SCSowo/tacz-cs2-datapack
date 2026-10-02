# 从 storage 恢复到当前区域（每区 6 个坐标）
function cs2d:map/fx_clear
execute store result score #zT cs2d.g run data get storage cs2d:tmp z[24]
execute store result score #zC cs2d.g run data get storage cs2d:tmp z[25]
execute store result score #zA cs2d.g run data get storage cs2d:tmp z[26]
execute store result score #zB cs2d.g run data get storage cs2d:tmp z[27]
# T 出生区
execute store result score #rx1 cs2d.g run data get storage cs2d:tmp z[0]
execute store result score #ry1 cs2d.g run data get storage cs2d:tmp z[1]
execute store result score #rz1 cs2d.g run data get storage cs2d:tmp z[2]
execute store result score #rx2 cs2d.g run data get storage cs2d:tmp z[3]
execute store result score #ry2 cs2d.g run data get storage cs2d:tmp z[4]
execute store result score #rz2 cs2d.g run data get storage cs2d:tmp z[5]
execute if score #zT cs2d.g matches 1 run function cs2d:map/zone_t
# CT 出生区
execute store result score #rx1 cs2d.g run data get storage cs2d:tmp z[6]
execute store result score #ry1 cs2d.g run data get storage cs2d:tmp z[7]
execute store result score #rz1 cs2d.g run data get storage cs2d:tmp z[8]
execute store result score #rx2 cs2d.g run data get storage cs2d:tmp z[9]
execute store result score #ry2 cs2d.g run data get storage cs2d:tmp z[10]
execute store result score #rz2 cs2d.g run data get storage cs2d:tmp z[11]
execute if score #zC cs2d.g matches 1 run function cs2d:map/zone_c
# A 包点
execute store result score #rx1 cs2d.g run data get storage cs2d:tmp z[12]
execute store result score #ry1 cs2d.g run data get storage cs2d:tmp z[13]
execute store result score #rz1 cs2d.g run data get storage cs2d:tmp z[14]
execute store result score #rx2 cs2d.g run data get storage cs2d:tmp z[15]
execute store result score #ry2 cs2d.g run data get storage cs2d:tmp z[16]
execute store result score #rz2 cs2d.g run data get storage cs2d:tmp z[17]
execute if score #zA cs2d.g matches 1 run function cs2d:map/zone_a
# B 包点
execute store result score #rx1 cs2d.g run data get storage cs2d:tmp z[18]
execute store result score #ry1 cs2d.g run data get storage cs2d:tmp z[19]
execute store result score #rz1 cs2d.g run data get storage cs2d:tmp z[20]
execute store result score #rx2 cs2d.g run data get storage cs2d:tmp z[21]
execute store result score #ry2 cs2d.g run data get storage cs2d:tmp z[22]
execute store result score #rz2 cs2d.g run data get storage cs2d:tmp z[23]
execute if score #zB cs2d.g matches 1 run function cs2d:map/zone_b
# 把两队传送到新地图的出生点
execute if entity @e[type=marker,tag=cs2d.spawnT,limit=1] run tp @a[team=T] @e[type=marker,tag=cs2d.spawnT,limit=1]
execute if entity @e[type=marker,tag=cs2d.spawnCT,limit=1] run tp @a[team=CT] @e[type=marker,tag=cs2d.spawnCT,limit=1]
execute as @a[team=!] at @s run spawnpoint @s ~ ~ ~
tellraw @a [{"text":"[CS2] 已加载槽位 ","color":"green"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"gold"},{"text":" 的地图","color":"green"}]
