scoreboard players set @s cs2d.kit 1
scoreboard players remove @s cs2d.money 400
# 拆弹钳不占格子：槽位规则里背包是禁用的，只记 cs2d.kit（拆除时长读它）
scoreboard players set @s cs2d.lb 52
scoreboard players set @s cs2d.lbp 400
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
