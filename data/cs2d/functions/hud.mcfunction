# ===== HUD（@s = 玩家，每秒刷新）=====
# 倒计时 / 存活人数 / 比分 都在顶部 bossbar；血量用原版血条、护甲用原版护甲条。
# actionbar 只留个人的：金钱 + 购买时间（M:SS）。
# 先算倒计时 M:SS（供「购买时间 M:SS」用）
scoreboard players set #sixty cs2d.tmp 60
execute if score #state cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp = #timer cs2d.g
execute if score #state cs2d.g matches 1 run scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
execute if score #state cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp = #timer cs2d.g
execute if score #state cs2d.g matches 1 run scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run scoreboard players operation #m cs2d.tmp = #buytime cs2d.g
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run scoreboard players operation #m cs2d.tmp /= #sixty cs2d.tmp
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run scoreboard players operation #s cs2d.tmp = #buytime cs2d.g
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. run scoreboard players operation #s cs2d.tmp %= #sixty cs2d.tmp

# 0 等待：已选队 → 热身时间；未选队 → 不显示
execute if score #state cs2d.g matches 0 if entity @s[team=!] run title @s actionbar {"text":"热身时间","color":"gray"}
# 1 冻结：购买时间 M:SS $金钱
execute if score #state cs2d.g matches 1 run title @s actionbar [{"text":"购买时间 ","color":"aqua"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"aqua","bold":true},{"text":":","color":"aqua"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"aqua","bold":true},{"text":"    $","color":"gold"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
# 2 对局（购买窗口过后）：$金钱
execute if score #state cs2d.g matches 2 unless entity @s[tag=cs2d.defusing] unless entity @s[tag=cs2d.planting] unless score #buytime cs2d.g matches 1.. run title @s actionbar [{"text":"$","color":"gold"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
# 2 开局后 20 秒内：购买时间 M:SS $金钱
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. unless entity @s[tag=cs2d.defusing] unless entity @s[tag=cs2d.planting] run title @s actionbar [{"text":"购买时间 ","color":"aqua"},{"score":{"name":"#m","objective":"cs2d.tmp"},"color":"aqua","bold":true},{"text":":","color":"aqua"},{"score":{"name":"#s","objective":"cs2d.tmp"},"color":"aqua","bold":true},{"text":"    $","color":"gold"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
# 3 结算：回合结束 $金钱
execute if score #state cs2d.g matches 3 run title @s actionbar [{"text":"回合结束   $","color":"gray"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
# 4 比赛结束 / 5 已停止：不显示
