# CT 出生区：按 #dir（1=外扩 2=内缩）整体调整一圈
scoreboard players operation #rx1 cs2d.g = #cx1 cs2d.g
execute if score #dir cs2d.g matches 1 run scoreboard players operation #rx1 cs2d.g -= #one cs2d.g
execute if score #dir cs2d.g matches 2 run scoreboard players operation #rx1 cs2d.g += #one cs2d.g
scoreboard players operation #rx2 cs2d.g = #cx2 cs2d.g
execute if score #dir cs2d.g matches 1 run scoreboard players operation #rx2 cs2d.g += #one cs2d.g
execute if score #dir cs2d.g matches 2 run scoreboard players operation #rx2 cs2d.g -= #one cs2d.g
scoreboard players operation #ry1 cs2d.g = #cy1 cs2d.g
scoreboard players operation #ry2 cs2d.g = #cy2 cs2d.g
scoreboard players operation #rz1 cs2d.g = #cz1 cs2d.g
execute if score #dir cs2d.g matches 1 run scoreboard players operation #rz1 cs2d.g -= #one cs2d.g
execute if score #dir cs2d.g matches 2 run scoreboard players operation #rz1 cs2d.g += #one cs2d.g
scoreboard players operation #rz2 cs2d.g = #cz2 cs2d.g
execute if score #dir cs2d.g matches 1 run scoreboard players operation #rz2 cs2d.g += #one cs2d.g
execute if score #dir cs2d.g matches 2 run scoreboard players operation #rz2 cs2d.g -= #one cs2d.g
function cs2d:map/zone_c
