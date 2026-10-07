# MP9 击杀 +$600
scoreboard players add @s cs2d.money 600
data modify storage cs2d:kill wpn set value "MP9"
tellraw @s [{"text":"解决一名敌人  ","color":"gray"},{"text":"+$600","color":"green","bold":true}]
