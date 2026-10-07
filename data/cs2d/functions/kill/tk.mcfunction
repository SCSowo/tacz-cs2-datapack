# 友军误杀惩罚：-$300（@s = 误杀者）
scoreboard players remove @s cs2d.money 300
execute if score @s cs2d.money matches ..-1 run scoreboard players set @s cs2d.money 0
tellraw @s [{"text":"友军误杀  ","color":"red"},{"text":"-$300","color":"red","bold":true}]
playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
