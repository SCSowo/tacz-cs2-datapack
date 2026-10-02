# 站在中心执行：以当前位置为中心、#rad 为半径设置CT 出生区
function cs2d:map/pos_read
function cs2d:map/zone_c
tellraw @a [{"text":"[CS2] CT 出生区: ","color":"green"},{"score":{"name":"#cx1","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#cz1","objective":"cs2d.g"},"color":"white"},{"text":" ~ ","color":"gray"},{"score":{"name":"#cx2","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#cz2","objective":"cs2d.g"},"color":"white"},{"text":"  (半径 ","color":"gray"},{"score":{"name":"#rad","objective":"cs2d.g"},"color":"white"},{"text":")","color":"gray"}]
