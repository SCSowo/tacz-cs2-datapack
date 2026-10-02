# 退还 凯夫拉背心（+$650）
scoreboard players set @s cs2d.arm 0
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000001
scoreboard players add @s cs2d.money 650
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "凯夫拉背心", "color": "green"}, {"text": "  +$650", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
