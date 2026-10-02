# C4 滴答：越接近爆炸越急促（每 tick 由 cs2d:tick 调用）
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players remove #beep cs2d.g 1
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 if score #beep cs2d.g matches ..0 run function cs2d:bomb_beep_go
