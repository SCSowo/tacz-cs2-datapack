# 拆除炸弹（@s = 玩家）
# 真正的拆包是「靠近炸弹蹲住 5s（有钳）/ 10s（无钳）」，这里只做条件自检和引导。
execute unless score #state cs2d.g matches 2 run title @s actionbar {"text":"只能在回合进行中拆除","color":"red"}
execute if score #state cs2d.g matches 2 unless entity @s[team=CT] run title @s actionbar {"text":"只有 CT 能拆除","color":"red"}
execute if score #state cs2d.g matches 2 if entity @s[team=CT] unless score #planted cs2d.g matches 1 run title @s actionbar {"text":"没有已安放的炸弹","color":"red"}
execute if score #state cs2d.g matches 2 if entity @s[team=CT,gamemode=!spectator] if score #planted cs2d.g matches 1 at @s unless entity @e[type=marker,tag=cs2d.bomb,distance=..3,limit=1] run title @s actionbar {"text":"离炸弹太远（要走到 3 格内）","color":"red"}
execute if score #state cs2d.g matches 2 if entity @s[team=CT,gamemode=!spectator] if score #planted cs2d.g matches 1 at @s if entity @e[type=marker,tag=cs2d.bomb,distance=..3,limit=1] if score @s cs2d.kit matches 1 run title @s actionbar {"text":"就位 —— 按住潜行（Shift）5 秒拆除","color":"green"}
execute if score #state cs2d.g matches 2 if entity @s[team=CT,gamemode=!spectator] if score #planted cs2d.g matches 1 at @s if entity @e[type=marker,tag=cs2d.bomb,distance=..3,limit=1] if score @s cs2d.kit matches 0 run title @s actionbar {"text":"就位 —— 按住潜行 10 秒（买钳子可缩短到 5 秒）","color":"green"}
scoreboard players enable @s cs2d.defl
