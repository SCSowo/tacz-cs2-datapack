# 安放炸弹（@s = 玩家）
# 真正的下包是「在包点内蹲下 4.5 秒」，这里只做条件自检和引导。
execute unless score #state cs2d.g matches 2 run title @s actionbar {"text":"只能在回合进行中安放","color":"red"}
execute if score #state cs2d.g matches 2 unless entity @s[team=T] run title @s actionbar {"text":"只有 T 能安放炸弹","color":"red"}
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run title @s actionbar {"text":"炸弹已经安放过了","color":"red"}
execute if score #state cs2d.g matches 2 if entity @s[team=T,gamemode=!spectator] if score #planted cs2d.g matches 0 run function cs2d:zone_plant_check
scoreboard players enable @s cs2d.plant
