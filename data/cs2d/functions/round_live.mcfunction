# 冻结结束 → 对局（CS2 回合时长 1:55 = 115 秒）
scoreboard players set #state cs2d.g 2
scoreboard players set #timer cs2d.g 115
# 开局后仍可购买 #buywin 秒（默认 20）
scoreboard players operation #buytime cs2d.g = #buywin cs2d.g
clear @a[team=!] minecraft:written_book{cs2d_buy:1b}
# 冻结期跑出出生区上的缓慢，这里解除
effect clear @a minecraft:slowness
playsound minecraft:block.note_block.bit master @a ~ ~ ~ 2 1
