# 切换玩家列表显示模式：/trigger cs2d.ctrl set 96
# 3（伤害）→ 2（击杀/死亡）→ 1（比值×100）→ 0（关）→ 循环
scoreboard players set #kdsw cs2d.g 2
execute if score #kdmode cs2d.g matches 2 run scoreboard players set #kdsw cs2d.g 1
execute if score #kdmode cs2d.g matches 1 run scoreboard players set #kdsw cs2d.g 0
execute if score #kdmode cs2d.g matches 0 run scoreboard players set #kdsw cs2d.g 3
scoreboard players operation #kdmode cs2d.g = #kdsw cs2d.g
# 应用
execute if score #kdmode cs2d.g matches 0 run scoreboard objectives setdisplay list
execute unless score #kdmode cs2d.g matches 0 run scoreboard objectives setdisplay list cs2d.kd
execute as @a run function cs2d:kd
# 提示
execute if score #kdmode cs2d.g matches 0 run tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"玩家列表：","color":"gray"},{"text":"关","color":"red","bold":true}]
execute if score #kdmode cs2d.g matches 1 run tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"玩家列表：","color":"gray"},{"text":"K/D 比值 ×100","color":"green","bold":true},{"text":"  （240 = 2.40）","color":"dark_gray"}]
execute if score #kdmode cs2d.g matches 2 run tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"玩家列表：","color":"gray"},{"text":"击杀 / 死亡","color":"green","bold":true},{"text":"  （12005 = 12杀5死）","color":"dark_gray"}]
execute if score #kdmode cs2d.g matches 3 run tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"玩家列表：","color":"gray"},{"text":"本场造成的伤害","color":"green","bold":true},{"text":"  （CS2 口径，MC 20 血 = CS2 100 血）","color":"dark_gray"}]
