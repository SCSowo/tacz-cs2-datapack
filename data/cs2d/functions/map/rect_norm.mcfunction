# 保证 #rx1<=#rx2 / #ry1<=#ry2 / #rz1<=#rz2
execute if score #rx1 cs2d.g > #rx2 cs2d.g run function cs2d:map/swx
execute if score #ry1 cs2d.g > #ry2 cs2d.g run function cs2d:map/swy
execute if score #rz1 cs2d.g > #rz2 cs2d.g run function cs2d:map/swz
