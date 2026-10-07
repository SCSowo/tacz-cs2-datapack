# AK-47 击杀 +$300
scoreboard players add @s cs2d.money 300
data modify storage cs2d:kill wpn set value "AK-47"
tellraw @s [{"text":"解决一名敌人  ","color":"gray"},{"text":"+$300","color":"green","bold":true}]
