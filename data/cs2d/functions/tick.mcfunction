# 每 tick
execute as @a[tag=!cs2d.in] at @s run function cs2d:join
function cs2d:team/tick
# 持续放开 trigger（书本点击的前提；无人在线时跳过以免刷日志）
execute if entity @a run function cs2d:unlock
execute as @a at @s run function cs2d:player_tick
advancement revoke @a only cs2d:kill
# C4 滴答（越接近爆炸越急促）
function cs2d:bomb_beep
# 掉落的 C4：销毁地面实体 + 匪方拾取
function cs2d:c4_tick

# ===== 快捷栏槽位强制：由 tick 标签自己计时，不再依赖 tick_second 的 schedule 链 =====
# #ivt 每 tick +1，减掉 #invhz 后 >=0 就扫一次并归零（默认 4 tick = 0.2 秒）
scoreboard players add #ivt cs2d.g 1
scoreboard players operation #ivt cs2d.g -= #invhz cs2d.g
execute if score #ivt cs2d.g matches 0.. run function cs2d:inv_scan
execute if score #ivt cs2d.g matches 0.. run scoreboard players set #ivt cs2d.g 0

# ===== 看门狗：tick_second 连续 2 秒没心跳就重启调度链 =====
scoreboard players add #hb cs2d.g 1
execute if score #hb cs2d.g matches 40.. run function cs2d:wd
