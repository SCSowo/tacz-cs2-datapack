# 比赛结束 → 挂起，等管理员在管理书第⑥页点「开始比赛」
scoreboard players set #state cs2d.g 5
title @a title {"text":"比赛结束","color":"yellow","bold":true}
title @a subtitle {"text":"等待管理员在管理书上点「开始比赛」","color":"gray"}
tellraw @a [{"text":"[CS2] 比赛结束。重开：执行 ","color":"gray"},{"text":"/function cs2d:start","color":"yellow","clickEvent":{"action":"suggest_command","value":"/function cs2d:start"}},{"text":" 或在管理书第⑥页点「开始比赛」","color":"gray"}]
# 关闭顶栏信息条
