# ===== HUD（@s = 玩家，每秒刷新）=====
# 倒计时 / 存活人数 / 比分 都在顶部 bossbar（右侧计分板已停用）；
# 血量用原版血条、护甲用原版护甲条，这里都不重复显示。
# 只留个人的：金钱。（护甲有原版护甲条，血量有原版血条，都不重复显示）
execute if score #state cs2d.g matches 0 if entity @s[team=] run title @s actionbar [{"text":"打开背包里的「","color":"gray"},{"text":"CS2 选边","color":"gold","bold":true},{"text":"」书，选择 T / CT","color":"gray"}]
execute if score #state cs2d.g matches 0 if entity @s[team=!] run title @s actionbar {"text":"等待管理员在管理书上点「开始比赛」","color":"gray"}
execute if score #state cs2d.g matches 1 run title @s actionbar [{"text":"购买时间 ","color":"aqua"},{"score":{"name":"#timer","objective":"cs2d.g"},"color":"aqua"},{"text":"s    $","color":"gold"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
execute if score #state cs2d.g matches 2 unless entity @s[tag=cs2d.defusing] unless entity @s[tag=cs2d.planting] run title @s actionbar [{"text":"$","color":"gold"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
# 开局后 20 秒内还能买：单独显示剩余购买时间（放在后面，覆盖上面那行）
execute if score #state cs2d.g matches 2 if score #buytime cs2d.g matches 1.. unless entity @s[tag=cs2d.defusing] unless entity @s[tag=cs2d.planting] run title @s actionbar [{"text":"购买时间 ","color":"aqua"},{"score":{"name":"#buytime","objective":"cs2d.g"},"color":"aqua"},{"text":"s    $","color":"gold"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
execute if score #state cs2d.g matches 3 run title @s actionbar [{"text":"回合结束   $","color":"gray"},{"score":{"name":"*","objective":"cs2d.money"},"color":"gold"}]
execute if score #state cs2d.g matches 4 run title @s actionbar {"text":"比赛结束 — 等待管理员在管理书上点「开始比赛」","color":"yellow"}
execute if score #state cs2d.g matches 5 if entity @s[team=!] run title @s actionbar {"text":"■ 已停止 — 等待管理员在管理书上点「开始比赛」","color":"red"}
execute if score #state cs2d.g matches 5 if entity @s[team=] run title @s actionbar [{"text":"打开背包里的「","color":"gray"},{"text":"CS2 选边","color":"gold","bold":true},{"text":"」书，选择 T / CT","color":"gray"}]
