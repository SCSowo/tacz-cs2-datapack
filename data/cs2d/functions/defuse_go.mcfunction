# 开始拆除（@s = 玩家）：有拆弹钳 5 秒 = 100 tick，无钳 10 秒 = 200 tick
tag @s add cs2d.defusing
scoreboard players operation @s cs2d.def = #deftn cs2d.g
execute if score @s cs2d.kit matches 1 run scoreboard players operation @s cs2d.def = #deftk cs2d.g
execute store result bossbar cs2d:defuse max run scoreboard players get @s cs2d.def
execute store result bossbar cs2d:defuse value run scoreboard players get @s cs2d.def
bossbar set cs2d:defuse players @s
bossbar set cs2d:defuse visible true
# 定住不能动（拆包时禁止移动）
effect give @s minecraft:slowness 20 6 true
# 剩余时间 M:SS（初始）
scoreboard players operation #tick cs2d.tmp = @s cs2d.def
scoreboard players operation #tick cs2d.tmp /= #twenty cs2d.g
scoreboard players operation #m cs2d.tmp = #tick cs2d.tmp
scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
scoreboard players operation #s cs2d.tmp = #tick cs2d.tmp
scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp
execute if score @s cs2d.kit matches 1 run bossbar set cs2d:defuse name [{"selector":"@s","color":"blue"},{"text":" 正在拆除炸弹。  ","color":"gray"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"green","bold":true},{"text":":","color":"green"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"green","bold":true}]
execute if score @s cs2d.kit matches 0 run bossbar set cs2d:defuse name [{"selector":"@s","color":"blue"},{"text":" 正在没有拆弹钳的情况下拆除炸弹。  ","color":"gray"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"green","bold":true},{"text":":","color":"green"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"green","bold":true}]
playsound minecraft:block.note_block.hat player @s ~ ~ ~ 2 1
