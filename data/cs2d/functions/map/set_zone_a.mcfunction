# 站在中心执行：以当前位置为中心、#rad 为半径设置A 包点（正方形）
function cs2d:map/pos_read
function cs2d:map/from_center
function cs2d:map/zone_a
tellraw @a [{"text":"[CS2] A 包点: ","color":"green"},{"score":{"name":"#ax1","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#az1","objective":"cs2d.g"},"color":"white"},{"text":" ~ ","color":"gray"},{"score":{"name":"#ax2","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#az2","objective":"cs2d.g"},"color":"white"}]
