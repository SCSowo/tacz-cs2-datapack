# 退还 闪光弹（+$200）
scoreboard players remove @s cs2d.nf 1
scoreboard players add @s cs2d.money 200
execute if score @s cs2d.nf matches 1 run item replace entity @s hotbar.3 with lrtactical:throwable{ThrowableId:"lrtactical:flash_grenade",cs2d_s:3b} 1
execute unless score @s cs2d.nf matches 1.. run item replace entity @s hotbar.3 with minecraft:air
scoreboard players set @s cs2d.lb 0
scoreboard players set @s cs2d.lbp 0
tellraw @s [{"text": "已退还 ", "color": "gray"}, {"text": "闪光弹", "color": "green"}, {"text": "  +$200", "color": "gold"}]
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 2 1.2
