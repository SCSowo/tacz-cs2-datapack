# MVP：本回合击杀最多者 +1
tag @a remove cs2d.mvp
scoreboard players set #mvpk cs2d.g -1
execute as @a[tag=cs2d.in] run function cs2d:mvp/vote
execute if score #mvpk cs2d.g matches 1.. run scoreboard players add @a[tag=cs2d.mvp,limit=1] cs2d.mvp 1
execute if score #mvpk cs2d.g matches 1.. run tellraw @a [{"text":"★ MVP ","color":"gold","bold":true},{"selector":"@a[tag=cs2d.mvp,limit=1]","color":"yellow"},{"text":"  (","color":"gray"},{"score":{"name":"#mvpk","objective":"cs2d.g"},"color":"white"},{"text":" 击杀)","color":"gray"}]
