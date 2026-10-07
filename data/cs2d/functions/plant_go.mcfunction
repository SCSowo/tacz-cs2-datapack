# 开始安放（@s = 玩家）
tag @s add cs2d.planting
scoreboard players set @s cs2d.plt 0
scoreboard players operation @s cs2d.mv0 = @s cs2d.mv
execute store result bossbar cs2d:plant max run scoreboard players get #plantt cs2d.g
bossbar set cs2d:plant value 0
bossbar set cs2d:plant players @s
bossbar set cs2d:plant visible true
# 定住不能动（下包时禁止移动）
effect give @s minecraft:slowness 20 6 true
# 剩余时间 M:SS（初始）
scoreboard players operation #tick cs2d.tmp = #plantt cs2d.g
scoreboard players operation #tick cs2d.tmp /= #twenty cs2d.g
scoreboard players operation #m cs2d.tmp = #tick cs2d.tmp
scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
scoreboard players operation #s cs2d.tmp = #tick cs2d.tmp
scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp
bossbar set cs2d:plant name [{"text":"正在安放C4  ","color":"red"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"red","bold":true},{"text":":","color":"red"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"red","bold":true}]
playsound minecraft:block.note_block.bass master @a ~ ~ ~ 2 0.8
