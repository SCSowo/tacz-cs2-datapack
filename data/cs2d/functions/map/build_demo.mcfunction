# 可选：一键生成演示平台（y=100 浮空，与地形隔离）+ 自动标记四个区域
# OP 执行一次：/function cs2d:map/build_demo
fill -15 99 -15 15 99 15 minecraft:stone_bricks
fill -15 100 -15 15 104 15 minecraft:air
fill -15 100 -15 15 102 -15 minecraft:stone_bricks
fill -15 100 15 15 102 15 minecraft:stone_bricks
fill -15 100 -15 -15 102 15 minecraft:stone_bricks
fill 15 100 -15 15 102 15 minecraft:stone_bricks
fill -5 100 -5 -5 102 5 minecraft:stone_bricks
fill 5 100 -5 5 102 5 minecraft:stone_bricks
fill 8 100 8 12 100 12 minecraft:gold_block
fill -12 100 -12 -8 100 -8 minecraft:gold_block
setworldspawn 0 100 0
execute positioned 12 100 0 run function cs2d:map/set_zone_t
execute positioned -12 100 0 run function cs2d:map/set_zone_ct
execute positioned 10 100 10 run function cs2d:map/set_zone_a
execute positioned -10 100 -10 run function cs2d:map/set_zone_b
tellraw @a [{"text":"[CS2] 演示平台已生成（y=100），四个区域已设好。执行 /function cs2d:map/save 可存为地图","color":"green"}]
