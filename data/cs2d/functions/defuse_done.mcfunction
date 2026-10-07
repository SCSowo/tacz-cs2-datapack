# 拆除完成（@s = 拆包者）：本人 +$300，CT 获胜
tag @s remove cs2d.defusing
effect clear @s minecraft:slowness
scoreboard players set @s cs2d.def 0
scoreboard players add @s cs2d.money 300
bossbar set cs2d:defuse visible false
bossbar set cs2d:defuse players
scoreboard players set #reason cs2d.g 3
kill @e[type=marker,tag=cs2d.bomb]
kill @e[type=item_display,tag=cs2d.bombfx]
title @s actionbar {"text":"炸弹已拆除  +$300","color":"green"}
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 2
function cs2d:win_ct
