# 退还 燃烧瓶（+$400）
scoreboard players remove @s cs2d.nm 1
scoreboard players add @s cs2d.money 400
execute if score @s cs2d.nm matches 1 run item replace entity @s hotbar.6 with lrtactical:throwable{ThrowableId:"lrtactical:molotov",cs2d_s:6b} 1
execute unless score @s cs2d.nm matches 1.. run item replace entity @s hotbar.7 with minecraft:air
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "燃烧瓶", "color": "green"}, {"text": "  +$400", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
