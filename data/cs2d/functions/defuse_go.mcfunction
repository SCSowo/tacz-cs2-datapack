# 开始拆除（@s = 玩家）：有拆弹钳 5 秒 = 100 tick，无钳 10 秒 = 200 tick
tag @s add cs2d.defusing
scoreboard players operation @s cs2d.def = #deftn cs2d.g
execute if score @s cs2d.kit matches 1 run scoreboard players operation @s cs2d.def = #deftk cs2d.g
execute store result bossbar cs2d:defuse max run scoreboard players get @s cs2d.def
execute store result bossbar cs2d:defuse value run scoreboard players get @s cs2d.def
bossbar set cs2d:defuse players @s
bossbar set cs2d:defuse visible true
# 只有拆包者本人看到
execute if score @s cs2d.kit matches 1 run title @s actionbar {"text":"拆除中… 保持蹲着（5 秒）","color":"green"}
execute if score @s cs2d.kit matches 0 run title @s actionbar {"text":"拆除中… 保持蹲着（10 秒）","color":"green"}
playsound minecraft:block.note_block.hat player @s ~ ~ ~ 2 1
