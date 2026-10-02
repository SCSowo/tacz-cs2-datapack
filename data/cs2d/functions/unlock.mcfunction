# ===== 开放所有 trigger 计分板 =====
# Minecraft 机制：trigger 类型的计分板，玩家每使用一次 /trigger 就会被自动关闭，
# 必须重新 enable 才能再点第二次。而且这个 enable 状态会在 /reload、重连、重启后丢失。
# 书本里的按钮走的全是 /trigger，所以这里统一放开，避免提示"你尚无法触发这个记分项"。
#
# 手动执行：/function cs2d:unlock （书本点了没反应时先跑一次这个）

scoreboard players enable @a cs2d.buy
scoreboard players enable @a cs2d.plant
scoreboard players enable @a cs2d.defl
scoreboard players enable @a cs2d.slot
scoreboard players enable @a cs2d.mapop
scoreboard players enable @a cs2d.zset
scoreboard players enable @a cs2d.rad
scoreboard players enable @a cs2d.ctrl
scoreboard players enable @a cs2d.team
