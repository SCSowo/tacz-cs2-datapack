# ===== 局外约束（@s = 玩家；#state 不是 1..4 即未开局 / 已强制停止）=====
# ① 不许持有任何游戏物品：枪 / 刀 / 投掷物 / C4 一律没收
execute if score #invout cs2d.g matches 1 unless score #state cs2d.g matches 1..4 run clear @s tacz:modern_kinetic_gun
execute if score #invout cs2d.g matches 1 unless score #state cs2d.g matches 1..4 run clear @s lrtactical:melee
execute if score #invout cs2d.g matches 1 unless score #state cs2d.g matches 1..4 run clear @s lrtactical:throwable
execute if score #invout cs2d.g matches 1 unless score #state cs2d.g matches 1..4 run clear @s minecraft:redstone_block{cs2d_c4:1b}
# ② 局外强制冒险模式：不能破坏 / 放置方块（创造、旁观不动，方便管理）
execute if score #invout cs2d.g matches 1 unless score #state cs2d.g matches 1..4 if entity @s[gamemode=survival] run gamemode adventure @s
