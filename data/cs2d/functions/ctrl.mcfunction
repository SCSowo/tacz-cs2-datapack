# 控制：1=开始 2=强制停止
execute if score @s cs2d.ctrl matches 1 run function cs2d:start
execute if score @s cs2d.ctrl matches 2 run function cs2d:stop
# 95 = 查看自己的本场战绩   96 = 切换玩家列表显示模式（伤害 / 击杀死亡 / K-D / 关）
execute if score @s cs2d.ctrl matches 95 run function cs2d:kd_show
execute if score @s cs2d.ctrl matches 96 run function cs2d:kd_toggle
# 97 = 切换队友 X 光
execute if score @s cs2d.ctrl matches 97 run function cs2d:xray_toggle
scoreboard players enable @s cs2d.ctrl
