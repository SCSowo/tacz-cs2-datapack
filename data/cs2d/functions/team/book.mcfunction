# 选队菜单（聊天栏按钮，@s = 玩家）
# 进服自动发一份；未选阵营的玩家每 20 秒自动补发一份
function cs2d:unlock
tellraw @s [{"text":"T ","color":"gold","bold":true},{"score":{"name":"#t","objective":"cs2d.tmp"},"color":"gold"},{"text":"   CT ","color":"blue","bold":true},{"score":{"name":"#c","objective":"cs2d.tmp"},"color":"blue"},{"text":"   未选 ","color":"dark_gray"},{"score":{"name":"#n","objective":"cs2d.tmp"},"color":"white"}]
tellraw @s [{"text":"[ 作为T方开始游戏 ]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/trigger cs2d.team set 1"}}]
tellraw @s [{"text":"[ 作为CT方开始游戏 ]","color":"blue","bold":true,"clickEvent":{"action":"run_command","value":"/trigger cs2d.team set 2"}}]
tellraw @s [{"text":"[ 随机分配到人少的一方 ]","color":"#3F7FA6","bold":true,"clickEvent":{"action":"run_command","value":"/trigger cs2d.team set 3"}}]
tellraw @s [{"text":"[ 作为旁观者开始游戏 ]","color":"gray","clickEvent":{"action":"run_command","value":"/trigger cs2d.team set 4"}}]
