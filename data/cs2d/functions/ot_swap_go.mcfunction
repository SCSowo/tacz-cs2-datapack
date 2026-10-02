# 取模后为 0 = 刚好打满一个加时半场 → 换边
# （#oth 为 0 时整段跳过，scoreboard operation %= 除 0 结果未定义）
execute if score #oth cs2d.g matches 1.. run scoreboard players operation #otm cs2d.g %= #oth cs2d.g
execute if score #oth cs2d.g matches 1.. if score #otm cs2d.g matches 0 run function cs2d:swap_sides
