# 退还 头盔（+$350）
scoreboard players set @s cs2d.arm 1
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000002
scoreboard players add @s cs2d.money 350
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "头盔", "color": "green"}, {"text": "  +$350", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
