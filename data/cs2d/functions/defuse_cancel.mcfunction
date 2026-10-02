# 中断拆除（@s = 拆包者）
execute if entity @s[tag=cs2d.defusing] run title @s actionbar {"text":"拆除中断","color":"red"}
execute if entity @s[tag=cs2d.defusing] run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.6 0.7
tag @s remove cs2d.defusing
scoreboard players set @s cs2d.def 0
bossbar set cs2d:defuse visible false
bossbar set cs2d:defuse players
