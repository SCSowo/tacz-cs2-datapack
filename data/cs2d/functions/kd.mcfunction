# 刷新玩家列表（Tab）右侧的显示值（@s = 玩家）
# 保险：没登记过的分数补 0，否则 operation 会静默失败
execute unless score @s cs2d.tk matches 0.. run scoreboard players set @s cs2d.tk 0
execute unless score @s cs2d.td matches 0.. run scoreboard players set @s cs2d.td 0
# 伤害基线：damage_dealt 是终身统计、不能靠 reset 清零（reset 只删记分板条目，
# 下次造成伤害时统计值会被整个写回来），所以用「当前累计 − 开赛时基线」算本场伤害
execute unless score @s cs2d.dmg matches 0.. run scoreboard players set @s cs2d.dmg 0
execute unless score @s cs2d.dmg0 matches 0.. run scoreboard players operation @s cs2d.dmg0 = @s cs2d.dmg
# 本场伤害（CS2 口径：damage_dealt 单位 0.1 MC 伤害点，MC 20 血 = CS2 100 血 → ÷2）
scoreboard players operation @s cs2d.dmgv = @s cs2d.dmg
scoreboard players operation @s cs2d.dmgv -= @s cs2d.dmg0
scoreboard players operation @s cs2d.dmgv /= #dmgdiv cs2d.g
# 模式 3（默认）：本场造成的伤害
execute if score #kdmode cs2d.g matches 3 run scoreboard players operation @s cs2d.kd = @s cs2d.dmgv
# 模式 2：K×1000 + D —— 12005 = 12 杀 5 死
execute if score #kdmode cs2d.g matches 2 run scoreboard players operation @s cs2d.kd = @s cs2d.tk
execute if score #kdmode cs2d.g matches 2 run scoreboard players operation @s cs2d.kd *= #kd1000 cs2d.g
execute if score #kdmode cs2d.g matches 2 run scoreboard players operation @s cs2d.kd += @s cs2d.td
# 模式 1：K/D×100 —— 240 = 2.40（一次没死过就按死 1 次算，避免除 0）
execute if score #kdmode cs2d.g matches 1 run scoreboard players operation @s cs2d.kd = @s cs2d.tk
execute if score #kdmode cs2d.g matches 1 run scoreboard players operation @s cs2d.kd *= #kd100 cs2d.g
execute if score #kdmode cs2d.g matches 1 if score @s cs2d.td matches 1.. run scoreboard players operation @s cs2d.kd /= @s cs2d.td
