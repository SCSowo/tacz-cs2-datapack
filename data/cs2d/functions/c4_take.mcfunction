# 捡起掉落的 C4（@s = T 玩家）
kill @e[type=item,tag=cs2d.c4drop,distance=..3]
kill @e[type=block_display,tag=cs2d.c4fx,distance=..3]
item replace entity @s hotbar.7 with minecraft:redstone_block{cs2d_c4:1b,cs2d_s:7b,display:{Name:'{"text":"C4 炸弹","color":"red","italic":false}',Lore:['{"text":"站在包点内按住潜行（Shift）3.25 秒安放","color":"gray","italic":false}','{"text":"移动或松开蹲会中断","color":"dark_gray","italic":false}','{"text":"爆炸倒计时 40 秒","color":"dark_gray","italic":false}']}} 1
scoreboard players set @s cs2d.c4 1
tellraw @a [{"text":"[CS2] ","color":"gold"},{"nbt":"Name","entity":"@s","color":"gold"},{"text":" 捡起了 C4","color":"gray"}]
playsound minecraft:entity.item.pickup player @s ~ ~ ~ 2 1.2
