# 测试用：满钱 $16000 + 呼出购买菜单（点按钮即可购买）
# 用法（服务器控制台）：/execute as <玩家名> run function cs2d:test/give_all
# 购买窗口 = 冻结期（state 1）或开局后 #buytime 秒内（state 2，默认 20 秒）
scoreboard players set @s cs2d.money 16000
function cs2d:buy_menu
