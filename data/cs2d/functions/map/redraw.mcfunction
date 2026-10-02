# 重绘所有已设置区域的高光
function cs2d:map/fx_clear
execute if score #zT cs2d.g matches 1 run function cs2d:map/fx_t
execute if score #zC cs2d.g matches 1 run function cs2d:map/fx_c
execute if score #zA cs2d.g matches 1 run function cs2d:map/fx_a
execute if score #zB cs2d.g matches 1 run function cs2d:map/fx_b
