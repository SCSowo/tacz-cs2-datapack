# 对局中每秒
# 1) T 全灭（且炸弹未安放）→ CT 胜
execute if score #state cs2d.g matches 2 if score #talive cs2d.g matches 1.. unless score #planted cs2d.g matches 1 unless entity @a[team=T,gamemode=!spectator] run function cs2d:win_ct
# 2) CT 全灭 → T 胜
execute if score #state cs2d.g matches 2 if score #calive cs2d.g matches 1.. unless entity @a[team=CT,gamemode=!spectator] run function cs2d:win_t
# 3) 回合时间到（未安放）→ CT 胜
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players remove #timer cs2d.g 1
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 if score #timer cs2d.g matches ..0 run scoreboard players set #reason cs2d.g 4
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 if score #timer cs2d.g matches ..0 run function cs2d:win_ct
# 4) 炸弹倒计时
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players remove #bomb cs2d.g 1
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 if score #bomb cs2d.g matches ..0 run function cs2d:bomb_explode
