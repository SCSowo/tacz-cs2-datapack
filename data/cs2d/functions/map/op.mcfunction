# 地图操作：1=保存 2=加载 3=删除 4=重绘高光 5=清除高光 6=列表 7=取管理书 8=命名
# 9=自动分队 10=全员重选阵营 11=发选队菜单
execute if score @s cs2d.mapop matches 1 run function cs2d:map/save
execute if score @s cs2d.mapop matches 2 run function cs2d:map/load
execute if score @s cs2d.mapop matches 3 run function cs2d:map/delete
execute if score @s cs2d.mapop matches 4 run function cs2d:map/redraw
execute if score @s cs2d.mapop matches 5 run function cs2d:map/zone_clear
execute if score @s cs2d.mapop matches 6 run function cs2d:map/list
execute if score @s cs2d.mapop matches 7 run function cs2d:map/book
execute if score @s cs2d.mapop matches 8 run function cs2d:map/name
execute if score @s cs2d.mapop matches 9 run function cs2d:team/autofill
execute if score @s cs2d.mapop matches 9 run function cs2d:team/balance
execute if score @s cs2d.mapop matches 10 run function cs2d:team/reset_all
execute if score @s cs2d.mapop matches 11 run function cs2d:team/book
scoreboard players enable @s cs2d.mapop
