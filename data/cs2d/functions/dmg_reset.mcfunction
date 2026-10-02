# 本场伤害归零：把当前累计伤害记为基线（@s = 玩家）
# damage_dealt 是终身统计，不能 reset —— reset 只清掉记分板条目，
# 下次造成伤害时整个统计值会被写回来。只能记基线做减法。
execute unless score @s cs2d.dmg matches 0.. run scoreboard players set @s cs2d.dmg 0
scoreboard players operation @s cs2d.dmg0 = @s cs2d.dmg
scoreboard players set @s cs2d.dmgv 0
scoreboard players set @s cs2d.kd 0
