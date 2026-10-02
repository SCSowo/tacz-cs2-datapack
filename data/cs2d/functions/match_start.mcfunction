# 比赛开始：MR12（先到 13 分），起始 $800
scoreboard players set #buytime cs2d.g 0
scoreboard players set #round cs2d.g 0
scoreboard players set #planted cs2d.g 0
scoreboard players set #bomb cs2d.g 0
scoreboard players set #half cs2d.g 0
scoreboard players set #ot cs2d.g 0
scoreboard players set #otbase cs2d.g 0
scoreboard players set #lossT cs2d.g 0
scoreboard players set #lossCT cs2d.g 0
scoreboard players set T cs2d.wins 0
scoreboard players set CT cs2d.wins 0
# 赛制固定 MR12：打满 12 回合换边，先到 13 分获胜（与本包默认值一致，存档里的旧值不会残留）
# 想打成 MR8 就把下面两行改成 8 / 9；加时赛目标分另算（进入时分数 +4）
scoreboard players set #halfr cs2d.g 12
scoreboard players set #target cs2d.g 13
# 全员起始资金与装备清零
scoreboard players set @a cs2d.money 800
scoreboard players set @a cs2d.w1 0
scoreboard players set @a cs2d.w1p 0
scoreboard players set @a cs2d.w2 0
scoreboard players set @a cs2d.w2p 0
scoreboard players set @a cs2d.nf 0
scoreboard players set @a cs2d.nh 0
scoreboard players set @a cs2d.ns 0
scoreboard players set @a cs2d.nm 0
scoreboard players set @a cs2d.arm 0
scoreboard players set @a cs2d.kit 0
scoreboard players set @a cs2d.kills 0
# K/D 按「本场」统计，开新比赛清零（CS2 每场记分板从 0 开始）
scoreboard players set @a cs2d.tk 0
scoreboard players set @a cs2d.td 0
scoreboard players set @a cs2d.kd 0
execute as @a run function cs2d:dmg_reset
scoreboard players set @a cs2d.mvp 0
tellraw @a [{"text":"===== 比赛开始！MR12 —— 先到 ","color":"yellow"},{"score":{"name":"#target","objective":"cs2d.g"},"color":"gold"},{"text":" 分获胜 =====","color":"yellow"}]
bossbar set cs2d:info visible true
bossbar set cs2d:info players @a
function cs2d:round_start
