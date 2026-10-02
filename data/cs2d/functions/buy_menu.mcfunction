# ===== CS2 购买菜单入口：按阵营分发到聊天栏按钮 =====
# （成书在 1.20.1 里没法用命令强制打开，聊天栏点一下就买更快，也不会被买枪顶掉）

execute if entity @s[team=T] run function cs2d:buy/chat_t
execute if entity @s[team=CT] run function cs2d:buy/chat_ct
execute if entity @s[team=] run tellraw @s [{"text": "先选阵营才能购买", "color": "red"}]
