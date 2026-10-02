# 加载槽位 #slot 的地图
scoreboard players set #found cs2d.g 0
execute as @e[type=marker,tag=cs2d.map] if score @s cs2d.mslot = #slot cs2d.g run scoreboard players set #found cs2d.g 1
execute as @e[type=marker,tag=cs2d.map] if score @s cs2d.mslot = #slot cs2d.g run data modify storage cs2d:tmp z set from entity @s data
execute if score #found cs2d.g matches 0 run tellraw @a [{"text":"[CS2] 槽位 ","color":"red"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"white"},{"text":" 没有地图记录（先设置区域再保存）","color":"red"}]
# 旧格式存档（17 个数：中心+半径）不再支持
execute if score #found cs2d.g matches 1 store result score #mlen cs2d.g run data get storage cs2d:tmp z
execute if score #found cs2d.g matches 1 if score #mlen cs2d.g matches ..27 run tellraw @a {"text":"[CS2] 该槽位是旧格式存档（只存了中心+半径），请重新标注区域后再保存","color":"red"}
execute if score #found cs2d.g matches 1 if score #mlen cs2d.g matches 28.. run function cs2d:map/load_go
