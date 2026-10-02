# 击杀奖励 + killfeed（@s = 杀手，由 cs2d:kill 进度触发）
advancement revoke @s only cs2d:kill
scoreboard players add @s cs2d.kills 1
scoreboard players add @s cs2d.tk 1
# 队友误伤不计入 K/D（CS2 里 TK 不加击杀数）：死者同队就把刚加的那 1 分退回去
execute if entity @s[team=T] if entity @a[team=T,scores={cs2d.deaths=1..},limit=1] run scoreboard players remove @s cs2d.tk 1
execute if entity @s[team=CT] if entity @a[team=CT,scores={cs2d.deaths=1..},limit=1] run scoreboard players remove @s cs2d.tk 1
function cs2d:kd
scoreboard players add @s cs2d.tk 1
function cs2d:kd
data modify storage cs2d:kill wpn set value "?"
data modify storage cs2d:tmp wpn set value ""
data modify storage cs2d:tmp wpn set from entity @s SelectedItem.tag.GunId
data modify storage cs2d:tmp mw set value ""
data modify storage cs2d:tmp mw set from entity @s SelectedItem.tag.MeleeWeaponId
execute if data storage cs2d:tmp {wpn:"cs2_wt:usp"} run function cs2d:kill/usp
execute if data storage cs2d:tmp {wpn:"cs2_wt:glock_18"} run function cs2d:kill/glock
execute if data storage cs2d:tmp {wpn:"cs2_wt:deagle"} run function cs2d:kill/deagle
execute if data storage cs2d:tmp {wpn:"cs2_wt:mac10"} run function cs2d:kill/mac10
execute if data storage cs2d:tmp {wpn:"cs2_wt:mp9"} run function cs2d:kill/mp9
execute if data storage cs2d:tmp {wpn:"cs2_wt:galilar"} run function cs2d:kill/galil
execute if data storage cs2d:tmp {wpn:"cs2_wt:ak47"} run function cs2d:kill/ak47
execute if data storage cs2d:tmp {wpn:"cs2_wt:m4a1"} run function cs2d:kill/m4a4
execute if data storage cs2d:tmp {wpn:"cs2_wt:awp"} run function cs2d:kill/awp
execute if data storage cs2d:tmp {wpn:"cs2_wt:mag7"} run function cs2d:kill/mag7
execute if data storage cs2d:tmp {mw:"cs2_wt:karambit"} run function cs2d:kill/knife
execute if data storage cs2d:kill {wpn:"?"} run function cs2d:kill/other
# killfeed：凶手 [武器] 死者
# killfeed：凶手（本队色） [武器] 死者（对方色）
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 2 2
execute if entity @s[team=T] run tellraw @a [{"selector":"@s","color":"gold"},{"text":"  「","color":"dark_gray"},{"nbt":"wpn","storage":"cs2d:kill","color":"#C08A2E"},{"text":"」  ","color":"gray"},{"selector":"@a[scores={cs2d.deaths=1..},limit=1]","color":"blue"}]
execute if entity @s[team=CT] run tellraw @a [{"selector":"@s","color":"blue"},{"text":"  「","color":"dark_gray"},{"nbt":"wpn","storage":"cs2d:kill","color":"#C08A2E"},{"text":"」  ","color":"gray"},{"selector":"@a[scores={cs2d.deaths=1..},limit=1]","color":"gold"}]
execute if entity @s[team=] run tellraw @a [{"selector":"@s","color":"gray"},{"text":"  「","color":"dark_gray"},{"nbt":"wpn","storage":"cs2d:kill","color":"#C08A2E"},{"text":"」  ","color":"gray"},{"selector":"@a[scores={cs2d.deaths=1..},limit=1]","color":"dark_gray"}]
