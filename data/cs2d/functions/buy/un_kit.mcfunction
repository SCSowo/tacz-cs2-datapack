# 退还 拆弹钳（+$400）
scoreboard players set @s cs2d.kit 0
scoreboard players add @s cs2d.money 400
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "拆弹钳", "color": "green"}, {"text": "  +$400", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
