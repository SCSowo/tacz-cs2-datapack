# AWP 击杀 +$100
scoreboard players add @s cs2d.money 100
data modify storage cs2d:kill wpn set value "AWP"
tellraw @s [{"text":"解决一名敌人  ","color":"gray"},{"text":"+$100","color":"green","bold":true}]
