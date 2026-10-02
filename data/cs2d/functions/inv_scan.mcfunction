# ===== 快捷栏槽位强制：每 #invhz tick 由 cs2d:tick 调用一次 =====
# 分两个文件是因为局外（#state 不是 1..4）要多做一层：不许拿游戏物品 + 强制冒险模式。
execute as @a run function cs2d:inv_fix
execute as @a run function cs2d:inv_out
