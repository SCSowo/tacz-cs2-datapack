# MAG-7 击杀 +$900
scoreboard players add @s cs2d.money 900
data modify storage cs2d:kill wpn set value "MAG-7"
tellraw @s [{"text":"解决一名敌人  ","color":"gray"},{"text":"+$900","color":"green","bold":true}]
