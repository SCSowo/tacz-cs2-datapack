# 结算结束 → 加时判定 → 下一回合 或 比赛结束
execute if score #ot cs2d.g matches 0 if score T cs2d.wins matches 12 if score CT cs2d.wins matches 12 run function cs2d:overtime
execute if score T cs2d.wins >= #target cs2d.g run function cs2d:match_end
execute if score CT cs2d.wins >= #target cs2d.g run function cs2d:match_end
execute if score #state cs2d.g matches 3 run function cs2d:round_start
