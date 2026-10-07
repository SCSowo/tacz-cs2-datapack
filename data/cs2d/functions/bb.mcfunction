# ===== 顶栏 bossbar cs2d:info =====
# 布局：T □□□ X   倒计时   Y □□□ CT
#   □ 的数量 = 该队存活人数（最多 5 个），紧挨着的数字 = 本队回合比分
# 方块串用 storage 存（1.20.1 不能动态重复字符串，只能按人数覆盖赋值）
# 由 tick_second 每秒调用一次；常驻显示。

# 存活人数（没有 cs2d.dead 标记的本队玩家）
execute store result score #at cs2d.tmp if entity @a[team=T,tag=!cs2d.dead]
execute store result score #ac cs2d.tmp if entity @a[team=CT,tag=!cs2d.dead]
# 常量
scoreboard players set #sixty cs2d.tmp 60
scoreboard players set #hun cs2d.tmp 100
scoreboard players set #maxt cs2d.tmp 1
scoreboard players set #bbv cs2d.tmp 0

# 存活方块串（tb = T，cb = CT）
execute if score #at cs2d.tmp matches 5.. run data modify storage cs2d:bar tb set value "□□□□□"
execute if score #at cs2d.tmp matches 4 run data modify storage cs2d:bar tb set value "□□□□"
execute if score #at cs2d.tmp matches 3 run data modify storage cs2d:bar tb set value "□□□"
execute if score #at cs2d.tmp matches 2 run data modify storage cs2d:bar tb set value "□□"
execute if score #at cs2d.tmp matches 1 run data modify storage cs2d:bar tb set value "□"
execute if score #at cs2d.tmp matches ..0 run data modify storage cs2d:bar tb set value ""
execute if score #ac cs2d.tmp matches 5.. run data modify storage cs2d:bar cb set value "□□□□□"
execute if score #ac cs2d.tmp matches 4 run data modify storage cs2d:bar cb set value "□□□□"
execute if score #ac cs2d.tmp matches 3 run data modify storage cs2d:bar cb set value "□□□"
execute if score #ac cs2d.tmp matches 2 run data modify storage cs2d:bar cb set value "□□"
execute if score #ac cs2d.tmp matches 1 run data modify storage cs2d:bar cb set value "□"
execute if score #ac cs2d.tmp matches ..0 run data modify storage cs2d:bar cb set value ""

# --- 常驻显示 ---
bossbar set cs2d:info visible true
bossbar set cs2d:info players @a

# --- ① 冻结/购买 M:SS ---
execute if score #state cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp = #timer cs2d.g
execute if score #state cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
execute if score #state cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp = #timer cs2d.g
execute if score #state cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp
execute if score #state cs2d.g matches 1 run bossbar set cs2d:info name [{"text":"T ","color":"#F0A54A"},{"nbt":"tb","storage":"cs2d:bar","color":"#F0A54A"},{"text":" ","color":"dark_gray"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"#F0A54A","bold":true},{"text":"   ","color":"dark_gray"},{"text":"购买时间 ","color":"blue"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"blue","bold":true},{"text":":","color":"blue"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"blue","bold":true},{"text":"   ","color":"dark_gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"#6FB3E8","bold":true},{"text":" ","color":"dark_gray"},{"nbt":"cb","storage":"cs2d:bar","color":"#6FB3E8"},{"text":" CT","color":"#6FB3E8"}]
execute if score #state cs2d.g matches 1 run bossbar set cs2d:info color blue
execute if score #state cs2d.g matches 1 run scoreboard players set #maxt cs2d.tmp 15
execute if score #state cs2d.g matches 1 run scoreboard players operation #bbv cs2d.tmp = #timer cs2d.g

# --- ② 对局 M:SS ---
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp = #timer cs2d.g
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp = #timer cs2d.g
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run bossbar set cs2d:info name [{"text":"T ","color":"#F0A54A"},{"nbt":"tb","storage":"cs2d:bar","color":"#F0A54A"},{"text":" ","color":"dark_gray"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"#F0A54A","bold":true},{"text":"   ","color":"dark_gray"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"green","bold":true},{"text":":","color":"green"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"green","bold":true},{"text":"   ","color":"dark_gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"#6FB3E8","bold":true},{"text":" ","color":"dark_gray"},{"nbt":"cb","storage":"cs2d:bar","color":"#6FB3E8"},{"text":" CT","color":"#6FB3E8"}]
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run bossbar set cs2d:info color green
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players set #maxt cs2d.tmp 115
execute if score #state cs2d.g matches 2 unless score #planted cs2d.g matches 1 run scoreboard players operation #bbv cs2d.tmp = #timer cs2d.g

# --- ② 已下包 C4 M:SS ---
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp = #bomb cs2d.g
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp = #bomb cs2d.g
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run bossbar set cs2d:info name [{"text":"T ","color":"#F0A54A"},{"nbt":"tb","storage":"cs2d:bar","color":"#F0A54A"},{"text":" ","color":"dark_gray"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"#F0A54A","bold":true},{"text":"   ","color":"dark_gray"},{"text":"C4 ","color":"red","bold":true},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"red","bold":true},{"text":":","color":"red"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"red","bold":true},{"text":"   ","color":"dark_gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"#6FB3E8","bold":true},{"text":" ","color":"dark_gray"},{"nbt":"cb","storage":"cs2d:bar","color":"#6FB3E8"},{"text":" CT","color":"#6FB3E8"}]
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run bossbar set cs2d:info color red
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players set #maxt cs2d.tmp 40
execute if score #state cs2d.g matches 2 if score #planted cs2d.g matches 1 run scoreboard players operation #bbv cs2d.tmp = #bomb cs2d.g

# --- ③ 回合结算 ---
execute if score #state cs2d.g matches 3 run bossbar set cs2d:info name [{"text":"T ","color":"#F0A54A"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"#F0A54A","bold":true},{"text":"  回合结束  ","color":"gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"#6FB3E8","bold":true},{"text":" CT","color":"#6FB3E8"}]
execute if score #state cs2d.g matches 3 run bossbar set cs2d:info color white
execute if score #state cs2d.g matches 3 run scoreboard players set #maxt cs2d.tmp 5
execute if score #state cs2d.g matches 3 run scoreboard players operation #bbv cs2d.tmp = #timer cs2d.g

# --- ④ 比赛结束 ---
execute if score #state cs2d.g matches 4 run bossbar set cs2d:info name [{"text":"T ","color":"#F0A54A"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"#F0A54A","bold":true},{"text":"  比赛结束  ","color":"yellow"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"#6FB3E8","bold":true},{"text":" CT","color":"#6FB3E8"}]
execute if score #state cs2d.g matches 4 run bossbar set cs2d:info color yellow
execute if score #state cs2d.g matches 4 run scoreboard players set #maxt cs2d.tmp 10
execute if score #state cs2d.g matches 4 run scoreboard players operation #bbv cs2d.tmp = #timer cs2d.g

# --- 进度条：#bbv / #maxt * 100 ---
scoreboard players operation #bbv cs2d.tmp *= #hun cs2d.tmp
scoreboard players operation #bbv cs2d.tmp /= #maxt cs2d.tmp
execute store result bossbar cs2d:info value run scoreboard players get #bbv cs2d.tmp

# --- 未开赛 ---
execute if score #state cs2d.g matches 0 run bossbar set cs2d:info name [{"text":"Counter-Strike 2 in Minecraft  正在等待开始","color":"dark_gray"}]
execute if score #state cs2d.g matches 0 run bossbar set cs2d:info color white

# --- 已停止 ---
execute if score #state cs2d.g matches 5 run bossbar set cs2d:info name [{"text":"T ","color":"#F0A54A"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"#F0A54A","bold":true},{"text":"  比赛终止  ","color":"gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"#6FB3E8","bold":true},{"text":" CT","color":"#6FB3E8"}]
execute if score #state cs2d.g matches 5 run bossbar set cs2d:info color white
