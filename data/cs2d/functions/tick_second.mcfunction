# 每秒：阶段推进 + 区域约束 + HUD
execute if score #state cs2d.g matches 1 run scoreboard players remove #timer cs2d.g 1
execute if score #state cs2d.g matches 1 if score #timer cs2d.g matches ..0 run function cs2d:round_live
execute if score #state cs2d.g matches 1 run function cs2d:zone_hold
execute if score #state cs2d.g matches 2 run function cs2d:round_tick
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run scoreboard players remove #buytime cs2d.g 1
execute if score #state cs2d.g matches 3 run scoreboard players remove #timer cs2d.g 1
execute if score #state cs2d.g matches 3 if score #timer cs2d.g matches ..0 run function cs2d:round_next
execute if score #state cs2d.g matches 4 run scoreboard players remove #timer cs2d.g 1
execute if score #state cs2d.g matches 4 if score #timer cs2d.g matches ..0 run function cs2d:match_hold
function cs2d:bb
execute as @a run function cs2d:hud
# 心跳：让 cs2d:tick 的看门狗知道这条调度链还活着
scoreboard players set #hb cs2d.g 0
schedule function cs2d:tick_second 1s
