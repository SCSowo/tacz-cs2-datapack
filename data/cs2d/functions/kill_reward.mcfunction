# 击杀奖励（@s = 杀手，由 cs2d:kill 进度触发）
advancement revoke @s only cs2d:kill
# 友军误杀判定：死者与本击杀手同队（死者 = 刚 death=1.. 的玩家）
scoreboard players set #tk cs2d.tmp 0
execute if entity @s[team=T] if entity @a[team=T,scores={cs2d.deaths=1..},limit=1] run scoreboard players set #tk cs2d.tmp 1
execute if entity @s[team=CT] if entity @a[team=CT,scores={cs2d.deaths=1..},limit=1] run scoreboard players set #tk cs2d.tmp 1
# 正常击杀才计本回合击杀数（MVP 用）
execute unless score #tk cs2d.tmp matches 1 run scoreboard players add @s cs2d.kills 1
# 武器判定（友军误杀不发放击杀奖励）
data modify storage cs2d:kill wpn set value "?"
data modify storage cs2d:tmp wpn set value ""
data modify storage cs2d:tmp wpn set from entity @s SelectedItem.tag.GunId
data modify storage cs2d:tmp mw set value ""
data modify storage cs2d:tmp mw set from entity @s SelectedItem.tag.MeleeWeaponId
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:usp"} run function cs2d:kill/usp
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:glock_18"} run function cs2d:kill/glock
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:deagle"} run function cs2d:kill/deagle
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:mac10"} run function cs2d:kill/mac10
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:mp9"} run function cs2d:kill/mp9
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:galilar"} run function cs2d:kill/galil
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:ak47"} run function cs2d:kill/ak47
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"tacz:m4a1"} run function cs2d:kill/m4a4
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:m4a1"} run function cs2d:kill/m4a1s
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:awp"} run function cs2d:kill/awp
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {wpn:"cs2_wt:mag7"} run function cs2d:kill/mag7
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:tmp {mw:"cs2_wt:karambit"} run function cs2d:kill/knife
execute unless score #tk cs2d.tmp matches 1 if data storage cs2d:kill {wpn:"?"} run function cs2d:kill/other
# 友军误杀惩罚 -$300
execute if score #tk cs2d.tmp matches 1 run function cs2d:kill/tk
execute unless score #tk cs2d.tmp matches 1 run playsound minecraft:block.note_block.pling player @s ~ ~ ~ 2 2
