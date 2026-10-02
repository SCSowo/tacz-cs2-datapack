# 用手上物品的名字给当前槽位命名（铁砧改名后拿着执行 /function cs2d:map/name）
data modify storage cs2d:tmp nm set from entity @s SelectedItem.tag.display.Name
execute as @e[type=marker,tag=cs2d.map] if score @s cs2d.mslot = #slot cs2d.g run data modify entity @s CustomName set from storage cs2d:tmp nm
tellraw @a [{"text":"[CS2] 槽位 ","color":"green"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"gold"},{"text":" 已命名（/function cs2d:map/list 查看）","color":"green"}]
