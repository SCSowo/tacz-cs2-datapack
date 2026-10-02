# 站在中心执行：以当前位置为中心、#rad 为半径设置T 出生区（正方形）
function cs2d:map/pos_read
function cs2d:map/from_center
function cs2d:map/zone_t
tellraw @a [{"text":"[CS2] T 出生区: ","color":"green"},{"score":{"name":"#tx1","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#tz1","objective":"cs2d.g"},"color":"white"},{"text":" ~ ","color":"gray"},{"score":{"name":"#tx2","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#tz2","objective":"cs2d.g"},"color":"white"}]
