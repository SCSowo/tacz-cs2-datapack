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
# 换边 = 新半场：装备全部清空（主武器 / 手枪 / 投掷物 / 护甲 / 拆弹钳），
# 下一回合 player_reset → kit/apply 只重发「默认手枪 + 刀」，经济另走 800/10000 重置。
scoreboard players set @a cs2d.kit 0
scoreboard players set @a cs2d.w1 0
scoreboard players set @a cs2d.w1p 0
scoreboard players set @a cs2d.w2 0
scoreboard players set @a cs2d.w2p 0
scoreboard players set @a cs2d.nf 0
scoreboard players set @a cs2d.nh 0
scoreboard players set @a cs2d.ns 0
scoreboard players set @a cs2d.nm 0
scoreboard players set @a cs2d.arm 0
# keepInventory=true 下原版不会代劳，手动 /function cs2d:swap_sides 也要真的清掉物品
clear @a
# 换边 = 新半场：经济按 CS2 重置（常规赛回到起始 $800 / 加时 $10000），连败阶梯清零
execute if score #ot cs2d.g matches 0 run scoreboard players set @a cs2d.money 800
execute if score #ot cs2d.g matches 1 run scoreboard players set @a cs2d.money 10000
scoreboard players set #lossT cs2d.g 0
scoreboard players set #lossCT cs2d.g 0
# 立刻把人送到新阵营的出生点（手动 /function cs2d:swap_sides 时也能生效）
execute as @a[team=!] at @s run function cs2d:spawn_home
title @a title {"text":"下半场","color":"yellow","bold":true}
execute if score #ot cs2d.g matches 1 run title @a title {"text":"加时赛","color":"yellow","bold":true}
execute as @a[team=T] run title @s subtitle {"text":"作为T方游戏","color":"gold"}
execute as @a[team=CT] run title @s subtitle {"text":"作为CT方游戏","color":"blue"}
