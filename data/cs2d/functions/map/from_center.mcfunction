# 用 #px/#py/#pz（中心）+ #rad（半径）填充矩形变量 #rx1..#rz2（正方形）
scoreboard players operation #rx1 cs2d.g = #px cs2d.g
scoreboard players operation #rx1 cs2d.g -= #rad cs2d.g
scoreboard players operation #rx2 cs2d.g = #px cs2d.g
scoreboard players operation #rx2 cs2d.g += #rad cs2d.g
scoreboard players operation #ry1 cs2d.g = #py cs2d.g
scoreboard players operation #ry1 cs2d.g -= #one cs2d.g
scoreboard players operation #ry2 cs2d.g = #py cs2d.g
scoreboard players operation #ry2 cs2d.g += #three cs2d.g
scoreboard players operation #rz1 cs2d.g = #pz cs2d.g
scoreboard players operation #rz1 cs2d.g -= #rad cs2d.g
scoreboard players operation #rz2 cs2d.g = #pz cs2d.g
scoreboard players operation #rz2 cs2d.g += #rad cs2d.g
