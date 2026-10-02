# 把 #rx1..#rz2 应用到 #zedit 指定的区域（1=T 2=CT 3=A 4=B）
execute if score #zedit cs2d.g matches 1 run function cs2d:map/zone_t
execute if score #zedit cs2d.g matches 2 run function cs2d:map/zone_c
execute if score #zedit cs2d.g matches 3 run function cs2d:map/zone_a
execute if score #zedit cs2d.g matches 4 run function cs2d:map/zone_b
