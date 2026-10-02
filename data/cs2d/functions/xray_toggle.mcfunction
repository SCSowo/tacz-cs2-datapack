# 切换队友 X 光：/trigger cs2d.ctrl set 97
scoreboard players set #xsw cs2d.g 0
execute if score #xray cs2d.g matches 1 run scoreboard players set #xsw cs2d.g 1
execute if score #xsw cs2d.g matches 1 run scoreboard players set #xray cs2d.g 0
execute if score #xsw cs2d.g matches 0 run scoreboard players set #xray cs2d.g 1
execute if score #xray cs2d.g matches 0 run effect clear @a minecraft:glowing
execute if score #xray cs2d.g matches 1 run function cs2d:xray
execute if score #xray cs2d.g matches 1 run tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"队友 X 光：","color":"gray"},{"text":"开","color":"green","bold":true}]
execute if score #xray cs2d.g matches 0 run tellraw @a [{"text":"[CS2] ","color":"gold"},{"text":"队友 X 光：","color":"gray"},{"text":"关","color":"red","bold":true}]
