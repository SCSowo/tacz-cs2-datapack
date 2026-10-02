# 半场换边：只把玩家换到对面阵营，地图一律不动
#
# 【重要】CS2 里出生点和包点都是**地图固定**的：换边后 T 从「地图上的 T 出生点」出发，
# 而不是从「上半场 CT 的出生点」出发。所以这里不交换区域坐标、不交换出生点 marker，
# 只换玩家的队伍 —— spawn_home 会按新阵营把人送到地图对应的出生点 marker。
#
# （早期版本把区域坐标 + marker + 队伍三样一起换，交换是对合运算，换两次 = 没换，
#   结果双方都还站在原地、高光方位也是反的。已删。）
scoreboard players set #half cs2d.g 1
# 玩家换队（经临时队中转，避免互相覆盖）
execute as @a[team=T] run team join cs2d_tmp @s
execute as @a[team=CT] run team join T @s
execute as @a[team=cs2d_tmp] run team join CT @s
# 比分跟着「人」走：见 cs2d:score_swap（#swapscore 设 0 可关）
execute if score #swapscore cs2d.g matches 1 run function cs2d:score_swap
# 装备里的阵营限定物品清掉（拆弹钳 / 手枪会由 kit 按新阵营重发）
scoreboard players set @a cs2d.kit 0
scoreboard players set @a cs2d.w2 0
scoreboard players set @a cs2d.w2p 0
# 换边 = 新半场：经济按 CS2 重置（常规赛回到起始 $800 / 加时 $10000），连败阶梯清零
execute if score #ot cs2d.g matches 0 run scoreboard players set @a cs2d.money 800
execute if score #ot cs2d.g matches 1 run scoreboard players set @a cs2d.money 10000
scoreboard players set #lossT cs2d.g 0
scoreboard players set #lossCT cs2d.g 0
# 立刻把人送到新阵营的出生点（手动 /function cs2d:swap_sides 时也能生效）
execute as @a[team=!] at @s run function cs2d:spawn_home
tellraw @a [{"text":"===== 交换阵营 =====","color":"gold","bold":true},{"text":"  比分 T ","color":"gray"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"gold"},{"text":" : ","color":"gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"blue"},{"text":" CT   先到 ","color":"gray"},{"score":{"name":"#target","objective":"cs2d.g"},"color":"yellow"},{"text":" 分获胜","color":"gray"}]
title @a title {"text":"交换阵营","color":"yellow","bold":true}
title @a subtitle {"text":"双方经济已重置","color":"gold"}
