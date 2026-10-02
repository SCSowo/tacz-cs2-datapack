# 自检：一条命令确认数据包到底加载了没有、当前状态是否正常。
# 用法：/function cs2d:diag
# 如果你连这条都提示"未知函数"，说明数据包根本没被启用 —— 看 §7 故障排查。

tellraw @a [{"text":"──── [CS2] 数据包自检 ────","color":"gold"}]

# 1. 包本身
tellraw @a [{"text":"● 数据包：","color":"gray"},{"text":"已加载 ✓","color":"green"},{"text":"  （能看到这条就说明 cs2d 命名空间是活的）","color":"dark_gray"}]

# 2. 状态机
tellraw @a [{"text":"● 状态 #state = ","color":"gray"},{"score":{"name":"#state","objective":"cs2d.g"},"color":"yellow"},{"text":"  （0等待 1冻结 2对局 3结算 4结束 5已强制停止）","color":"dark_gray"}]

# 3. 比分 / 目标
tellraw @a [{"text":"● 比分 T ","color":"gray"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"gold"},{"text":" : ","color":"gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"blue"},{"text":"   先到 ","color":"gray"},{"score":{"name":"#target","objective":"cs2d.g"},"color":"yellow"},{"text":" 分获胜","color":"gray"}]
tellraw @a [{"text":"● 半场 ","color":"gray"},{"score":{"name":"#halfr","objective":"cs2d.g"},"color":"yellow"},{"text":" 回合换边  第 ","color":"gray"},{"score":{"name":"#round","objective":"cs2d.g"},"color":"white"},{"text":" 回合  已换边 ","color":"gray"},{"score":{"name":"#half","objective":"cs2d.g"},"color":"white"},{"text":"  加时 ","color":"gray"},{"score":{"name":"#ot","objective":"cs2d.g"},"color":"white"}]

# 4. 区域设置情况
tellraw @a [{"text":"● 区域已设：T=","color":"gray"},{"score":{"name":"#zT","objective":"cs2d.g"},"color":"gold"},{"text":" CT=","color":"gray"},{"score":{"name":"#zC","objective":"cs2d.g"},"color":"blue"},{"text":" A=","color":"gray"},{"score":{"name":"#zA","objective":"cs2d.g"},"color":"gold"},{"text":" B=","color":"gray"},{"score":{"name":"#zB","objective":"cs2d.g"},"color":"green"},{"text":"  （0=未设 1=已设）","color":"dark_gray"}]

# 5. 当前地图槽位 + 在线人数（先算出来，避免分数不存在导致显示失败）
scoreboard players set #pcount cs2d.g 0
execute as @a run scoreboard players add #pcount cs2d.g 1
tellraw @a [{"text":"● 当前地图槽位 = ","color":"gray"},{"score":{"name":"#slot","objective":"cs2d.g"},"color":"yellow"},{"text":"   在线人数 = ","color":"gray"},{"score":{"name":"#pcount","objective":"cs2d.g"},"color":"white"}]

# 6. trigger 授权
tellraw @a [{"text":"● 书本按钮授权：","color":"gray"},{"text":"已重新开放 ✓","color":"green"}]

# 顺便把 trigger 全放开，保证书能点
function cs2d:unlock
tellraw @a [{"text":"● 换边后若出生区 / 高光方位反了，执行一次 ","color":"gray"},{"text":"/function cs2d:map/unswap","color":"yellow"},{"text":" 复原（只跑一次）","color":"gray"}]

# 7. C4 在谁身上 + 安放耗时
execute as @a[team=T,gamemode=!spectator] store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0
execute if entity @a[team=T,scores={cs2d.c4=1..}] run tellraw @a [{"text":"● 携带 C4：","color":"gray"},{"selector":"@a[team=T,scores={cs2d.c4=1..},limit=1]","color":"gold"}]
execute unless entity @a[team=T,scores={cs2d.c4=1..}] run tellraw @a [{"text":"● 当前无人携带 C4（回合开始才发）","color":"gray"}]
tellraw @a [{"text":"● 安放耗时 = ","color":"gray"},{"score":{"name":"#plantt","objective":"cs2d.g"},"color":"yellow"},{"text":" tick = 3.25 秒（默认；包点内按住潜行）","color":"gray"}]
tellraw @a [{"text":"● 槽位扫描 每 ","color":"gray"},{"score":{"name":"#invhz","objective":"cs2d.g"},"color":"yellow"},{"text":" tick 一次   局外约束 ","color":"gray"},{"score":{"name":"#invout","objective":"cs2d.g"},"color":"white"},{"text":"   严格槽位 ","color":"gray"},{"score":{"name":"#invstrict","objective":"cs2d.g"},"color":"white"},{"text":"   心跳 ","color":"gray"},{"score":{"name":"#hb","objective":"cs2d.g"},"color":"dark_gray"},{"text":"（>20 说明 tick_second 链断了，看门狗会重启）","color":"dark_gray"}]
