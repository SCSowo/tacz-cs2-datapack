# tick_second 的调度链断了（/reload、数据包热重载等）→ 重启它
# 心跳 #hb 由 cs2d:tick 每 tick +1、由 cs2d:tick_second 每秒清零；超过 40 tick 说明链断了。
scoreboard players set #hb cs2d.g 0
schedule clear cs2d:tick_second
schedule function cs2d:tick_second 1s
