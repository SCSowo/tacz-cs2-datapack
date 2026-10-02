# 安放中每 tick（@s = 玩家，带 cs2d.planting）
# 本 tick 是否蹲着 → #snk 1/0（NBT 主判据 + sneak_time 备判据）
scoreboard players set #snk cs2d.tmp 0
execute if entity @s[nbt={Sneaking:1b}] run scoreboard players set #snk cs2d.tmp 1
execute if score @s cs2d.snk > @s cs2d.snk0 run scoreboard players set #snk cs2d.tmp 1
# --- 中断条件 ---
execute unless score #state cs2d.g matches 2 run function cs2d:plant_cancel
execute if score #planted cs2d.g matches 1 run function cs2d:plant_cancel
execute unless entity @s[team=T,gamemode=!spectator] run function cs2d:plant_cancel
execute if entity @s[tag=cs2d.planting] unless score #snk cs2d.tmp matches 1 run function cs2d:plant_cancel
# 移动超过 5cm 就中断（CS2 里安放时不能动）
execute if entity @s[tag=cs2d.planting] run scoreboard players operation #mv cs2d.tmp = @s cs2d.mv
execute if entity @s[tag=cs2d.planting] run scoreboard players operation #mv cs2d.tmp -= @s cs2d.mv0
execute if entity @s[tag=cs2d.planting] if score #mv cs2d.tmp matches 5.. run function cs2d:plant_cancel
# C4 掉了 / 离开包点
execute if entity @s[tag=cs2d.planting] store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0
execute if entity @s[tag=cs2d.planting] if score @s cs2d.c4 matches ..0 run function cs2d:plant_cancel
execute if entity @s[tag=cs2d.planting] run function cs2d:zone_in_ab
execute if entity @s[tag=cs2d.planting] unless score #in cs2d.g matches 1 run function cs2d:plant_cancel
# --- 推进 ---
execute if entity @s[tag=cs2d.planting] run scoreboard players add @s cs2d.plt 1
execute if entity @s[tag=cs2d.planting] store result bossbar cs2d:plant value run scoreboard players get @s cs2d.plt
# 每 10 tick 一声滴答 + 烟尘
execute if entity @s[tag=cs2d.planting] run scoreboard players operation #p cs2d.tmp = @s cs2d.plt
execute if entity @s[tag=cs2d.planting] run scoreboard players operation #p cs2d.tmp %= #ten cs2d.g
execute if entity @s[tag=cs2d.planting] if score #p cs2d.tmp matches 0 at @s run playsound minecraft:block.note_block.hat master @a[distance=..40] ~ ~ ~ 2 1.4
execute if entity @s[tag=cs2d.planting] if score #p cs2d.tmp matches 0 at @s run particle minecraft:smoke ~ ~0.4 ~ 0.3 0.15 0.3 0.01 3
# --- 完成 ---
execute if entity @s[tag=cs2d.planting] if score @s cs2d.plt >= #plantt cs2d.g run function cs2d:plant_done
