# 拆除进度（每 tick，@s = 拆包者）：统一 -1，时长由 defuse_go 决定（有钳 100 / 无钳 200）
# 本 tick 是否蹲着 → #snk 1/0
scoreboard players set #snk cs2d.tmp 0
execute if entity @s[nbt={Sneaking:1b}] run scoreboard players set #snk cs2d.tmp 1
execute if score @s cs2d.snk > @s cs2d.snk0 run scoreboard players set #snk cs2d.tmp 1
# --- 中断条件 ---
execute unless score #state cs2d.g matches 2 run function cs2d:defuse_cancel
execute unless score #planted cs2d.g matches 1 run function cs2d:defuse_cancel
execute unless entity @s[team=CT,gamemode=!spectator] run function cs2d:defuse_cancel
execute if entity @s[tag=cs2d.defusing] unless score #snk cs2d.tmp matches 1 run function cs2d:defuse_cancel
execute if entity @s[tag=cs2d.defusing] at @s unless entity @e[type=marker,tag=cs2d.bomb,distance=..3,limit=1] run function cs2d:defuse_cancel
# --- 推进 ---
execute if entity @s[tag=cs2d.defusing] run scoreboard players remove @s cs2d.def 1
execute if entity @s[tag=cs2d.defusing] store result bossbar cs2d:defuse value run scoreboard players get @s cs2d.def
# 每 10 tick：一声滴答 + 火花 + 续一次 actionbar（actionbar 会自己淡出，得补发）
execute if entity @s[tag=cs2d.defusing] run scoreboard players operation #p cs2d.tmp = @s cs2d.def
execute if entity @s[tag=cs2d.defusing] run scoreboard players operation #p cs2d.tmp %= #ten cs2d.g
execute if entity @s[tag=cs2d.defusing] if score #p cs2d.tmp matches 0 at @s run playsound minecraft:block.note_block.hat master @a[distance=..16] ~ ~ ~ 1.6 1.4
execute if entity @s[tag=cs2d.defusing] if score #p cs2d.tmp matches 0 at @s run particle minecraft:electric_spark ~ ~0.4 ~ 0.25 0.15 0.25 0.01 2
execute if entity @s[tag=cs2d.defusing] if score #p cs2d.tmp matches 0 if score @s cs2d.kit matches 1 run title @s actionbar {"text":"拆除中… 保持蹲着（5 秒）","color":"green"}
execute if entity @s[tag=cs2d.defusing] if score #p cs2d.tmp matches 0 if score @s cs2d.kit matches 0 run title @s actionbar {"text":"拆除中… 保持蹲着（10 秒）","color":"green"}
# --- 完成 ---
execute if entity @s[tag=cs2d.defusing] if score @s cs2d.def matches ..0 run function cs2d:defuse_done
