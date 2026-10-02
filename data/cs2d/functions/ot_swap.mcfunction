# 加时赛换边判定：进入加时后每 #oth 回合（默认 3）换一次边
# #otbase = 进入加时那一刻的 #round（常规赛打完是 24）
# 例：#otbase=24 → 第 25/26/27 回合一个半场，第 28 回合开始换边（28-24-1=3，3%3=0）
scoreboard players operation #otm cs2d.g = #round cs2d.g
scoreboard players operation #otm cs2d.g -= #otbase cs2d.g
scoreboard players operation #otm cs2d.g -= #one cs2d.g
execute if score #otm cs2d.g matches 1.. run function cs2d:ot_swap_go
