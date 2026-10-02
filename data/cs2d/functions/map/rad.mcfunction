# 半径调整：1=+1 2=-1
execute if score @s cs2d.rad matches 1 run function cs2d:map/rad_up
execute if score @s cs2d.rad matches 2 run function cs2d:map/rad_down
scoreboard players enable @s cs2d.rad
