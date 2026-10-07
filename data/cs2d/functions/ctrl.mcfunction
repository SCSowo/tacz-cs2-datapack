# 控制：1=开始 2=强制停止
execute if score @s cs2d.ctrl matches 1 run function cs2d:start
execute if score @s cs2d.ctrl matches 2 run function cs2d:stop
scoreboard players enable @s cs2d.ctrl
