# ===== CS2 竞技模式 · 最小可玩 Demo (cs2d) =====
# 状态 #state: 0=等待开局 1=冻结购买 2=对局 3=回合结算 4=比赛结束 5=强制停止
#
# 重要：下面所有 add 命令都套了 `execute store success storage ... run`。
# 原因：计分板 / 队伍 / bossbar 是"世界数据"，服务器重启和 /reload 之后都还在，
# 直接 add 会报"已存在"并中断整个 load 函数（第 82 行的 schedule 就跑不到了，整个包会假死）。
# 套上 store success 后：已存在就静默跳过、保留原值；不存在才真正创建。

execute store success storage cs2d:tmp ok byte 1 run schedule clear cs2d:tick_second

# 计分板
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.g dummy {"text":"全局变量"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.tmp dummy {"text":"临时变量"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.hp dummy {"text":"生命"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.money dummy {"text":"金钱"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.wins dummy {"text":"比分"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.kit dummy {"text":"拆弹器"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.w1 dummy {"text":"主武器"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.w2 dummy {"text":"副武器"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.w1p dummy
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.w2p dummy
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.nf dummy {"text":"闪光弹"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.nh dummy {"text":"高爆手雷"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.ns dummy {"text":"烟雾弹"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.nm dummy {"text":"燃烧瓶"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.arm dummy {"text":"护甲等级"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.kills dummy {"text":"本回合击杀"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.mvp dummy {"text":"MVP数"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.def dummy {"text":"拆除进度"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.plt dummy {"text":"安放进度"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.c4 dummy {"text":"持有C4"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.mv0 dummy {"text":"安放起点位移"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.mv minecraft.custom:minecraft.walk_one_cm {"text":"行走距离"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.snk minecraft.custom:minecraft.sneak_time {"text":"蹲行时间"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.snk0 dummy {"text":"蹲行基准"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.lx dummy {"text":"最后位置X"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.ly dummy {"text":"最后位置Y"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.lz dummy {"text":"最后位置Z"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.mslot dummy {"text":"地图槽位(实体)"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.deaths minecraft.custom:minecraft.deaths {"text":"死亡"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.buy trigger {"text":"购买"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.plant trigger {"text":"安放炸弹"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.defl trigger {"text":"拆除炸弹"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.slot trigger {"text":"选择地图槽位"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.mapop trigger {"text":"地图操作"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.zset trigger {"text":"设置区域"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.rad trigger {"text":"调整半径"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.ctrl trigger {"text":"开始/停止"}
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.team trigger {"text":"选择阵营"}
# 退款用：lb = 上一次购买的商品码，lbp = 实付金额
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.lb dummy
execute store success storage cs2d:tmp ok byte 1 run scoreboard objectives add cs2d.lbp dummy
# 右侧计分板已停用：比分 / 存活 / 倒计时统一走顶部 bossbar cs2d:info
# （cs2d.wins 计分板本身保留，只是不再 setdisplay 到 sidebar）
scoreboard objectives setdisplay sidebar
# 玩家列表（Tab）右侧不再显示 K/D / 伤害（该功能无法正常显示，已移除）
scoreboard objectives setdisplay list

# 队伍
execute store success storage cs2d:tmp ok byte 1 run team add T {"text":"T 阵营","color":"gold"}
team modify T color gold
# 不同队伍互相看不到名字牌（同队可见）—— 对应 CS2：敌方没有名字标签
team modify T nametagVisibility hideForOtherTeams
team modify T seeFriendlyInvisibles true
execute store success storage cs2d:tmp ok byte 1 run team add CT {"text":"CT 阵营","color":"blue"}
team modify CT color blue
# 不同队伍互相看不到名字牌（同队可见）—— 对应 CS2：敌方没有名字标签
team modify CT nametagVisibility hideForOtherTeams
team modify CT seeFriendlyInvisibles true
# 半场换边用的中转队伍（避免互换时互相覆盖）
execute store success storage cs2d:tmp ok byte 1 run team add cs2d_tmp {"text":"换边中转","color":"gray"}
team modify cs2d_tmp color gray
team modify cs2d_tmp seeFriendlyInvisibles false

# 拆除进度条
execute store success storage cs2d:tmp ok byte 1 run bossbar add cs2d:defuse {"text":"拆除进度","color":"blue"}
bossbar set cs2d:defuse max 200
bossbar set cs2d:defuse style progress
bossbar set cs2d:defuse visible false

# 安放进度条
execute store success storage cs2d:tmp ok byte 1 run bossbar add cs2d:plant {"text":"安放炸弹","color":"red"}
bossbar set cs2d:plant max 65
bossbar set cs2d:plant style progress
bossbar set cs2d:plant visible false

# 顶栏信息条：阶段 + 倒计时 + 双方剩余人数
execute store success storage cs2d:tmp ok byte 1 run bossbar add cs2d:info {"text":"CS2 竞技","color":"dark_gray"}
bossbar set cs2d:info max 100
bossbar set cs2d:info style progress
bossbar set cs2d:info color blue

# 游戏规则
gamerule keepInventory true
gamerule doImmediateRespawn true
gamerule doMobSpawning false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doFireTick false
gamerule mobGriefing false
gamerule announceAdvancements false
gamerule naturalRegeneration false

# 初始化
scoreboard players set #state cs2d.g 0
scoreboard players set #round cs2d.g 0
scoreboard players set #planted cs2d.g 0
scoreboard players set #bomb cs2d.g 0
scoreboard players set #w cs2d.g 0
scoreboard players set #reason cs2d.g 1
# 赛制固定 MR12：打满 12 回合换边，先到 13 分获胜（与本包默认值一致，存档里的旧值不会残留）
# 想打成 MR8 就把下面两行改成 8 / 9；加时赛目标分另算（进入时分数 +4）
scoreboard players set #halfr cs2d.g 12
scoreboard players set #target cs2d.g 13
execute unless score #minp cs2d.g matches 1.. run scoreboard players set #minp cs2d.g 2
# 半场 / 加时 / 连败计数（CS2 连败补偿阶梯用）
execute unless score #half cs2d.g matches 0.. run scoreboard players set #half cs2d.g 0
execute unless score #ot cs2d.g matches 0.. run scoreboard players set #ot cs2d.g 0
execute unless score #otbase cs2d.g matches 0.. run scoreboard players set #otbase cs2d.g 0
execute unless score #oth cs2d.g matches 1.. run scoreboard players set #oth cs2d.g 3
# 换边时是否把比分挪到新的阵营栏：1=挪（CS2 记分板语义，默认） 0=分数固定在阵营名下
execute unless score #swapscore cs2d.g matches 0.. run scoreboard players set #swapscore cs2d.g 1
execute unless score #sws cs2d.g matches 0.. run scoreboard players set #sws cs2d.g 0
execute unless score #otm cs2d.g matches 0.. run scoreboard players set #otm cs2d.g 0
execute unless score #lossT cs2d.g matches 0.. run scoreboard players set #lossT cs2d.g 0
execute unless score #lossCT cs2d.g matches 0.. run scoreboard players set #lossCT cs2d.g 0
execute unless score #mvpk cs2d.g matches 0.. run scoreboard players set #mvpk cs2d.g 0
# 比分：未开赛时 T/CT 还没有分数，HUD 里要显示，这里补 0（已开赛则保留）
execute unless score T cs2d.wins matches 0.. run scoreboard players set T cs2d.wins 0
execute unless score CT cs2d.wins matches 0.. run scoreboard players set CT cs2d.wins 0

# 常量
scoreboard players set #one cs2d.g 1
scoreboard players set #two cs2d.g 2
scoreboard players set #three cs2d.g 3
scoreboard players set #ten cs2d.g 10
scoreboard players set #twenty cs2d.g 20
scoreboard players set #sixty cs2d.tmp 60
# 开局后仍可购买的秒数（CS2 是走出购买区就不能买，这里用时间近似）：
# /scoreboard players set #buywin cs2d.g 30 可改成 30 秒
execute unless score #buywin cs2d.g matches 1.. run scoreboard players set #buywin cs2d.g 20
scoreboard players set #buytime cs2d.g 0
# 安放所需 tick（3.25 秒 = 65 tick）：/scoreboard players set #plantt cs2d.g 65 可改
execute unless score #plantt cs2d.g matches 1.. run scoreboard players set #plantt cs2d.g 65
# 旧默认 90（4.5 秒）自动迁移一次；手调成别的值不受影响
execute if score #plantt cs2d.g matches 90 run scoreboard players set #plantt cs2d.g 65
# 拆除所需 tick：有拆弹钳 5 秒 = 100，无钳 10 秒 = 200（改这两个就能调）
execute unless score #deftk cs2d.g matches 1.. run scoreboard players set #deftk cs2d.g 100
execute unless score #deftn cs2d.g matches 1.. run scoreboard players set #deftn cs2d.g 200
# 区域半径（设置区域时的默认半径：/scoreboard players set #rad cs2d.g 5）
execute unless score #rad cs2d.g matches 1.. run scoreboard players set #rad cs2d.g 3
# 当前地图槽位
execute unless score #slot cs2d.g matches 1.. run scoreboard players set #slot cs2d.g 1
# 当前编辑区（对角法用）：1=T 2=CT 3=A 4=B
execute unless score #zedit cs2d.g matches 1..4 run scoreboard players set #zedit cs2d.g 1
# 对角法角① 是否已记录
execute unless score #hasp1 cs2d.g matches 0.. run scoreboard players set #hasp1 cs2d.g 0
# 交换用临时 / 扩缩方向
execute unless score #swp cs2d.g matches 0.. run scoreboard players set #swp cs2d.g 0
execute unless score #dir cs2d.g matches 1.. run scoreboard players set #dir cs2d.g 1
# 各阵营人数（选队菜单 / 管理书里动态显示）
scoreboard players set #t cs2d.tmp 0
scoreboard players set #c cs2d.tmp 0
scoreboard players set #n cs2d.tmp 0
# 区域已设置标志：#zT=T家 #zC=CT家 #zA=A包点 #zB=B包点
execute unless score #zT cs2d.g matches 0.. run scoreboard players set #zT cs2d.g 0
execute unless score #zC cs2d.g matches 0.. run scoreboard players set #zC cs2d.g 0
execute unless score #zA cs2d.g matches 0.. run scoreboard players set #zA cs2d.g 0
execute unless score #zB cs2d.g matches 0.. run scoreboard players set #zB cs2d.g 0

# 快捷栏槽位强制扫描间隔（单位 tick）：小=响应快开销大，20=回到原来的一秒一次
execute unless score #invhz cs2d.g matches 1.. run scoreboard players set #invhz cs2d.g 4
# 局外（未开局 / 已强制停止）是否也约束：1=不许持有游戏物品 + 强制冒险模式
execute unless score #invout cs2d.g matches 0..1 run scoreboard players set #invout cs2d.g 1
# 是否严格执行「每格只放该放的东西」（书除外，管理书要留着翻）
execute unless score #invstrict cs2d.g matches 0..1 run scoreboard players set #invstrict cs2d.g 1
# 扫描计时器 / tick_second 心跳（看门狗用）
scoreboard players set #ivt cs2d.g 0
scoreboard players set #hb cs2d.g 0
# 选队菜单补发倒计时（tick）：到 0 就给未选阵营的玩家重发一份，然后重置为 400（20 秒）
scoreboard players set #tmenu cs2d.g 400


# /reload 之后 trigger 授权会丢，这里补一次（否则书本按钮点了提示"你尚无法触发这个记分项"）
execute if entity @a run function cs2d:unlock

schedule function cs2d:tick_second 1s
tellraw @a [{"text":"[ Counter-Strike 2 in Minecraft ]","color":"gold"}]
