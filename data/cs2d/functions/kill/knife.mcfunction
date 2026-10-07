# 刀杀 +$1500
scoreboard players add @s cs2d.money 1500
data modify storage cs2d:kill wpn set value "刀"
tellraw @s [{"text":"解决一名敌人  ","color":"gray"},{"text":"+$1500","color":"green","bold":true}]
