# 退还 凯夫拉+头盔（+$1000）
scoreboard players set @s cs2d.arm 0
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000001
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000002
scoreboard players add @s cs2d.money 1000
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "凯夫拉+头盔", "color": "green"}, {"text": "  +$1000", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
