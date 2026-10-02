# 站在中心执行：以当前位置为中心、#rad 为半径设置B 包点（正方形）
function cs2d:map/pos_read
function cs2d:map/from_center
function cs2d:map/zone_b
tellraw @a [{"text":"[CS2] B 包点: ","color":"green"},{"score":{"name":"#bx1","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#bz1","objective":"cs2d.g"},"color":"white"},{"text":" ~ ","color":"gray"},{"score":{"name":"#bx2","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#bz2","objective":"cs2d.g"},"color":"white"}]
