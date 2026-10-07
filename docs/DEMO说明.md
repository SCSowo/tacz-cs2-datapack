# tacz-cs2-datapack — CS2 竞技模式数据包（1.20.1）

> 本文档是**完整使用与开发说明**：安装、地图与区域管理、购买与经济、炸弹、HUD、故障排查。
> 武器 / 经济 / 回合 / 赛制的数值总表见 [`CS2主流程.md`](CS2主流程.md)。
> 快速上手看仓库根目录的 [`README.md`](../README.md)。

> 文中提到的 `gen_fix*.py` 等一次性 patch 生成器**属于开发历史，未随公开仓库发布**；
> `_bak_before_*/` 是当时改前备份，同样不在仓库里。它们只作变更记录阅读。

> **需要 forge + TaCZ + lrtactical**：本包已接入 TaCZ 真枪（4 套枪包共 32 把）、
> 绿葡萄战术装备投掷物、CS2 官方经济与赛制，**不是纯原版数据包**。
>
> 本文档讲**地图与区域管理**（标出生区/包点、多地图槽位、高光、故障排查）。

CS2 主流程已实装：MR12 先到 13 分、购买时间 15 秒、回合 1:55、炸弹 40 秒、拆除 10 秒（有钳 5 秒）、起始 $800 / 上限 $16000、连败补偿阶梯、半场换边、加时赛。

## 一、5 分钟跑起来

1. 把本仓库整个文件夹复制（或 `git clone`）到服务端 `world\datapacks\` 下。
2. 开服，进服后 OP 执行一次：`/function cs2d:map/build_demo`
   → 在 y=100 生成 31×31 浮空平台，并自动标记好 T/CT 出生点和两个包点（金块）。
   （自己的地图就别建平台，改用 `/function cs2d:map/set_spawn_t|ct|set_site_a|b` 站位置上执行。）
3. 每个人进服会拿到一本 **「CS2 选边」** 书（背包里，点击即用）：
   `加入 恐怖分子 · T` / `加入 反恐精英 · CT` / `随机分配到人少的一方` / `退出阵营 · 旁观`。
   书丢了会自动补发；也能用 `/function cs2d:team` 手动重发。
4. 管理员拿管理书 `/function cs2d:book` → 第 **⑥ 开局 / 分队** 页点 **[ 开始比赛 ]**。
   → **不再自动开赛**：没人点开始就一直停在准备状态；比赛打完也会停在这里等开始。
   → 点开始时，还没选阵营的人会自动补进人少的一方；只有一方有人则随机调 1 人过去，凑不齐会提示。

## 二、Demo 里有什么

| 模块 | 内容 |
|---|---|
| 分队 | **自选阵营**：进服发「CS2 选边」书，自己点 T（橙）/ CT（蓝）；开局时未选的人自动补进人少的一方；中途加入先观战，下一回合上场 |
| 开局 | 管理书第⑥页点 **[ 开始比赛 ]** 才开；另有 [ 强制停止 ] / [ 自动分队 ] / [ 全员重选阵营 ] / [ 发一本选队书 ] |
| 回合 | 冻结 8s → 对局 90s → 结算 5s → 下一回合 |
| 胜负 | 歼灭 / 炸弹爆炸 / 拆除 / 时间到（时间到判 CT 胜） |
| 经济 | 起始 $800，击杀 +$300，胜 +$3250，负 +$1400 |
| 购买 | 成书点击 → `/trigger cs2d.buy set 1\2\3`（主武器 / 凯夫拉 / 拆弹器） |
| 炸弹 | 随机 T 持 C4；**包点内按住潜行 3.25 秒**安放，40s 爆炸；CT **炸弹 3 格内按住潜行**拆除（有钳 5s / 无钳 10s，bossbar 进度） |
| HUD | actionbar：阶段计时 / 金钱 / 血量 / 比分 |
| 比分 | 先到 3 分（`#target`）获胜，10 秒后重开 |
| 强制停止 | `/function cs2d:stop` 中止且不再自动开始；`/function cs2d:start` 重开 |
| **区域** | T/CT 出生区、A/B 包点均为**可调矩形**（支持对角两点自定义长宽，不必是正方形），常驻高光（彩色发光玻璃地面 + 悬浮标签）；冻结阶段跑出出生区会被拉回 |

占位武器：USP=木剑、AK=铁剑、M4=钻石剑。

## 三、文件分层（照这个顺序读就懂了）

```
load.mcfunction          计分板 / 队伍 / bossbar / 规则 / 初始值
tick.mcfunction          每 tick：加入 → 玩家逻辑 → 撤销击杀进度
tick_second.mcfunction   每秒：阶段推进 + 冻结期区域约束 + HUD
join.mcfunction          分队、观战、自动开赛
player_tick.mcfunction   死亡检测 + 三个 trigger 分发 + 拆弹进度
match_start / match_end  比赛层
round_start / round_live / round_tick / round_end / round_next / win_t / win_ct
player_reset / death / kill_reward
buy_menu / buy / buy_rifle / buy_kevlar / buy_kit
bomb_plant / bomb_planted / bomb_explode
bomb_defuse / defuse_go / defuse_tick / defuse_cancel / defuse_done
map/*                    区域(zone_* 从矩形变量写入)、高光(fx_*)、中心定位(mk_at)、演示平台
map/set_zone_*           标法一：中心 + #rad → from_center → zone_*
map/p1|p2|p2_go|apply    标法二：对角两点 → from_corners → rect_norm → apply
map/from_center|from_corners|rect_norm|swx|swy|swz   ← 两种标法共用的坐标计算
map/rad_up|rad_down|rescale_*   整体外扩 / 内缩 1 格（矩形也适用）
map/save|load|load_go|delete|list|name|book|redraw|zone_clear|op|slot_pick|zset|zedit_tell
zone_read_pos / zone_in_t|c|a|b / zone_plant_check / zone_hold*
team/book          选队书（别名 /function cs2d:team）
team/join_t|join_ct|join_auto|leave
team/autofill|balance|reset_all|reset_go|tick
team_pick.mcfunction    cs2d.team trigger 分发（1=T 2=CT 3=随机 4=退出 5=重发书）
hud.mcfunction
stop.mcfunction / start.mcfunction / ctrl.mcfunction / match_hold.mcfunction
```

状态机就一个数：`#state` = 0 等待 / 1 冻结 / 2 对局 / 3 结算 / 4 比赛结束 / **5 强制停止**。

## 三之二、强制停止 / 重新开始

```
/function cs2d:stop     # 立刻中止当前回合和比赛，且不会再自动开始
/function cs2d:start    # 解除停止并重开一场
```

- `stop` 会：清掉炸弹和拆除进度、清空背包与成书、比分和金钱归零、全员转生存、停掉所有阶段计时。
- 停止后玩家进出、人数够了都**不会**自动开赛（状态锁在 5），HUD 常驻红字提示。
- 只有 `/function cs2d:start`（或 `/function cs2d:match_start` 前先把 `#state` 设回 0）才会重新开始。

## 三之三、选阵营（T 橙 / CT 蓝）

- 队伍配色：**T = 橙（gold）**，**CT = 蓝（blue）**。玩家名、比分、killfeed、出生区高光玻璃（橙 / 浅蓝）全部统一。
- 进服即发一本 **「CS2 选边」** 书（`cs2d_teambook` 标签）。点按钮走 `/trigger cs2d.team set N`：

| N | 作用 |
|---|---|
| 1 | 加入 T |
| 2 | 加入 CT |
| 3 | 随机分配到人少的一方 |
| 4 | 退出阵营 → 旁观 |
| 5 | 重新发一本选队书 |

- 书丢了会自动补发（`team/tick` 每 tick 检查未选阵营玩家的背包）；手动重发 `/function cs2d:team`。
- 开局前可随时换边；**比赛途中选边要下一回合才上场**（本回合保持旁观）。
- 人数统计存在 `#t` / `#c` / `#n`（T 人数 / CT 人数 / 未选人数），选队书和管理书第⑥页都用 score 组件实时显示。
- 点「开始比赛」的顺序：`team/autofill`（未选的人补进人少的一方）→ `team/balance`（只有一方有人时，从另一方随机调 1 人）→ 校验双方都 ≥1 人 → `match_start`。
- 比赛结束后不再自动重开：`match_hold` 把状态挂到 5，等管理员再点「开始比赛」。

## 三之四、购买菜单 + 顶栏信息条

**购买菜单 = 聊天栏按钮（`cs2d:buy_menu`，回合开始时自动推一份）**

> 成书方案已废弃：1.20.1 **没有任何命令能强制打开成书 GUI**，而且要占格子、会被买枪顶掉。
> 现在全程走聊天栏：点一下就买，能连续买，也不会丢。

- 开局按阵营推 6 行（主武器 / 手枪 / 投掷 / 装备 / 退款 / 重看菜单），每行都是 `名称 $价格` 按钮，走 `/trigger cs2d.buy set N`。
- 聊天栏滚上去了翻不到 → 点最后一行「重看本菜单」（= `/trigger cs2d.buy set 98`）再要一份。
- T 版：MAC-10 / Galil AR / AK-47 / AWP + 燃烧瓶 $400；CT 版：MP9 / MAG-7 / M4A4 / AWP + 拆弹钳 + 燃烧弹 $600（CS2 里 Molotov 和 Incendiary 本来就是两个价）。
- 默认手枪（Glock-18 / USP-S）不列 —— 开局就有，买了也是同一把。

**购买窗口：冻结期 + 开局后 20 秒**

- 冻结期（15 秒）全程可买；开局后还有 **20 秒** 可以继续买（CS2 是「走出购买区就不能买」，这里用时间近似）。
- 调参：`/scoreboard players set #buywin cs2d.g 30`，回合开始时生效。
- actionbar 在这两个阶段都显示 `购买时间 Ns   $金钱`（冻结期读 `#timer`，开局后读 `#buytime`）。

**退款（`/trigger cs2d.buy set 99`，菜单最后一行按钮）**

- 每次购买都会记下商品码（`cs2d.lb`）和实付金额（`cs2d.lbp`），窗口内可退**最近一次**，全额返还（护甲按实付退：单独头盔退 $350、整套退 $1000）。
- 退主武器 → 直接消失；退手枪 → 恢复成默认手枪（T 回 Glock-18、CT 回 USP-S）；退投掷物 → 数量 -1 并刷新槽位。
- 退款后金额封顶 $16000；回合开始时 `cs2d.lb` 归零，上回合买的不能退。
- 分发在 `buy/go.mcfunction` 第一行（`cs2d.buy matches 99 → cs2d:buy/refund`）。
  > **曾经这里漏了 99 分支** —— `refund.mcfunction` 写得好好的但没人调用，点「退款」按钮毫无反应。

**换枪（不用先退款）**

- 买新的主武器 / 手枪时，手上已有的那把会**按原价自动折回**（+`$原价`），再扣新枪的钱 —— CS2 里同一时间只能有一把主武器。
- 价格记在 `cs2d.w1p` / `cs2d.w2p`（买枪时写入，退款 / 死亡 / 换边 / 槽位归零时一起清零），所以不需要维护「编码 → 价格」对照表。

**防重复购买**

- 已持有同款武器 → 拒绝并提示「你已持有 XXX」（想换别的枪直接买，旧枪自动折价退回，见上）。
- 投掷物每种有上限（闪光 2 个、其余 1 个）、护甲 / 头盔 / 拆弹钳已有 → 一律拒绝，不会重复扣钱。

**顶栏信息条（bossbar `cs2d:info`）**

- 倒计时和双方剩余人数都搬到屏幕顶部的 bossbar，进度条 = 剩余时间比例。
- 显示内容随阶段切换：

| 阶段 | bossbar 文字 | 颜色 |
|---|---|---|
| 购买 15s | `购买 15s   T 4 : 5 CT` | 蓝 |
| 对局 115s | `回合 1:42   T 4 : 5 CT` | 绿 |
| 已安弹 40s | `炸弹 38s   T 4 : 5 CT` | 红 |
| 回合结算 | `回合结束 5s   T … : … CT` | 白 |
| 比赛结束 | `比赛结束   T 13 : 8 CT` | 黄 |

| 未开赛 | `CS2 竞技   T 0 : 0 CT` | 白 |
| 已停止 | `已停止   T 3 : 2 CT` | 白 |

- 存活人数 = 本队里没有 `cs2d.dead` 标记的玩家，存在 `#at` / `#ac`（`cs2d.tmp`）。
- **右侧计分板已停用**：`load` 里 `scoreboard objectives setdisplay sidebar`（清空显示槽，`cs2d.wins` 计分板本身保留只是不显示）。所以 `cs2d:info` 改成**常驻显示**，任何阶段都能看到比分。想临时恢复侧边栏：`/scoreboard objectives setdisplay sidebar cs2d.wins`（重开服会被覆盖回去）。
- actionbar 只剩 `$金钱`（血量用原版血条、护甲用原版护甲条，都不重复显示）。

## 三之五、蹲着下包（CS2 式长按安放）

**操作：站在包点里，按住潜行（Shift）3.25 秒。** 走位会中断，松开蹲也中断，中断后要重新蹲满 3.25 秒。

- 每回合随机一名 T 携带 C4（`redstone_block{cs2d_c4:1b}`），回合开始会私聊告知本人、并在 T 队内广播是谁带包；C4 的 Lore 也写明了操作方式。
- 蹲下时若条件满足 → 打 `cs2d.planting` 标记，进度条走 bossbar `cs2d:plant`（红，max 65 = 3.25 秒），同时 T 队收到「T 正在安放炸弹！」，每 10 tick 一声滴答 + 一团烟。
- 包点压根没设过会提示一次（`/function cs2d:map/set_zone_a`）。**踏进包点不再弹提示**（之前那个 actionbar 已被删掉）。
- 中断条件：松开潜行 / 移动超过 5cm（`walk_one_cm` 差值）/ 离开包点 / C4 掉了 / 死亡 / 回合结束 / 强制停止。中断后 `cs2d.plt` 归零。
- `/trigger cs2d.plant set 1`（或 `/function cs2d:bomb_plant`）现在**只做自检**：逐条告诉你卡在哪一条（不是 T / 不在回合中 / 已安放 / 没 C4 / 包点没设 / 不在包点内），全绿则提示「站着别动，按住潜行 3.25 秒」。

### 修掉的「下不了包」真因

| # | 问题 | 修法 |
|---|---|---|
| 1 | 旧代码用 `nbt={Inventory:[{id:"minecraft:redstone_block",tag:{cs2d_c4:1b}}]}` 找 C4。**Minecraft 的 NBT 列表匹配是按下标对齐的，只比对背包第 0 个物品**，而 C4 是 give 追加进去的，永远不在 0 号位 → 永远提示「你身上没有 C4」 | 改用 `execute store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0`（`clear 0` 只统计不移除，且匹配任意槽位） |
| 2 | `zone_plant_check` 既是判定又顺手触发下包，逻辑绕且没法复用 | 拆出纯判定 `zone_in_ab`（只写 `#in`），下包统一由 `plant_done` 走 |
| 3 | 炸弹 marker 用 `~ ~ ~` 生成，依赖调用方的执行位置 | 改成 `execute at @s run summon …`，marker 必定落在安放者脚下（拆弹的 3 格判定才准） |
| 4 | 背包满了 C4 会掉地上、没人发现 | 回合开始后校验一次，真没进背包就全服报警 |

新增 / 改动的文件：`zone_in_ab`、`plant_try`、`plant_go`、`plant_tick`、`plant_cancel`、`plant_done`、`zone_plant_check`、`bomb_plant`、`bomb_planted`、`load`（新增 `cs2d.plt` / `cs2d.c4` / `cs2d.mv` / `cs2d.mv0` / `cs2d.snk` / `cs2d.snk0` 与 `cs2d:plant` bossbar、常量 `#ten` `#plantt`）、`player_tick`、`round_start`、`round_end`、`stop`、`death`、`join`、`player_reset`、`diag`。生成器：`gen_plant.py`（幂等）。

调参：`/scoreboard players set #plantt cs2d.g 40`（默认 65 tick = 3.25 秒；bossbar max 由 `plant_go` 自动跟随，不用手动同步）。

## 三之六、本轮打磨：槽位 / 连续购买 / 音效 / 顶栏

### 快捷栏重排（C4 固定第 5 格）

| 格 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|---|
| 内容 | 主武器 | 手枪 | 刀 | 闪光弹 | **C4** | 高爆 | 烟雾 | 燃烧瓶 | （空） |

拆弹钳挪进背包第 1 格，不再占快捷栏。

**为什么以前会"吞 C4"**：买枪用 `item replace hotbar.0`（只改第 1 格），而 C4 是 `give` 发的 —— `give` 永远填**第一个空槽**，正好是第 1 格，于是一买枪就被整把顶掉。现在 C4 直接写死第 5 格，投掷物顺移一格，谁都碰不到它。

### 连续购买

- 购买菜单在聊天栏，**消息不会消失**，点完一个再点下一个，一口气买完；每次点完 `buy.mcfunction` 末尾都会 `scoreboard players enable @s cs2d.buy` 重新开放触发器（trigger 每执行一次就自动关闭）。
- 第 9 格不再放书（成书方案已废弃），手里那把枪不会被任何东西顶掉。

### C4 滴答 + 爆炸范围 + 音量

- 滴答改由 `bomb_beep`（每 tick）驱动，间隔随剩余时间缩短：>20s 每 1 秒 → 20~11s 每 0.5 秒 → 10~6s 每 0.25 秒 → 最后 5 秒每 0.15 秒，音调也一段段升高。原来每秒一声的那条已从 `round_tick` 删除。
- 爆炸：**12 格内必死**，12~20 格瞬间伤害 IV（按 CS2 近期那次扩大 C4 半径的更新调的）。要改就动 `bomb_explode.mcfunction` 里的两个 `distance=`。
- 全局音量：所有 `< 2.0` 的 `playsound` 统一提到 2.0（26 处），关键音效单独加大 —— 爆炸 6、滴答 3、安放 3、回合开始 2、胜负 2。（脚本只处理 <2.0 的，天然幂等，重跑不会越来越响。）

### HUD / 顶栏

- actionbar **去掉 HP**（用原版血条），只剩 `$金钱` 和护甲。
- 顶栏改成 CS2 布局：`T □□□ 3   1:42   5 □□□□ CT`
  - **□ 数量 = 存活人数**（最多 5 个，第 6 人以上仍显示 5 个）
  - 紧挨着的**数字 = 回合比分**
  - 中间是倒计时（购买 / 回合 / `C4 40`）
  - 方块串存在 `cs2d:bar` 的 `tb` / `cb`，用 `{"nbt":…}` 组件渲染。1.20.1 没法按分数重复字符串，只能按人数覆盖赋值六次。

### 聊天栏只留 CS2 原文案

删掉的：起始资金说明、"已购买 XXX -$NNNN"、"T 安放炸弹全员 +$300"、额外补偿 $800、"T 正在安放炸弹"、下包/拆弹教学提示、进服的啰嗦说明。

改到 actionbar 的（不占聊天栏）：钱不够、已达上限、不是本阵营、只能在购买阶段买、安放/拆除中断、不在包点、冻结期不能离开出生区。

留下的：`炸弹已安放` / `炸弹已拆除` / 击杀 feed / 换边 / 比赛结束 / 加时 / 管理员指令反馈 / diag 自检。回合横幅也改成 CS2 说法：`恐怖分子获胜` / `反恐精英获胜` + 副标题原因（`炸弹爆炸` / `炸弹已拆除` / `时间耗尽` / `反恐精英被歼灭` / `恐怖分子被歼灭`）。

补的音效：购买成功（叮）、购买失败（村民摇头"不行"）、击杀（高音叮）、安放/拆除、回合开始、回合胜（升级音）/ 负（低音）、爆炸（6）。

### 改动文件

新增：`bomb_beep`、`bomb_beep_go`、`gen_polish.py`（幂等生成器）。
改动：`buy_menu`、`bb`、`hud`、`bomb_explode`、`bomb_planted`、`round_start`、`round_end`、`round_tick`、`tick`、`kill_reward`、`join`、`plant_*`、`defuse_*`、`zone_*`、`bomb_plant`、`bomb_defuse`、`kit/apply`、`nade/*`、`buy/*`（全部）。改前备份在 `_bak_before_polish/`。

## 三之七、复活点位 / 安放拆除时长 / 购买书分阵营（2026-09-26 第二轮）

### 1. 死亡之后位置不对

真因：服务器开了 `gamerule doImmediateRespawn true`，玩家一死就被**瞬间丢到自己的重生点（没设过就是世界出生点）**，然后 `death.mcfunction` 才把他切成旁观 —— 位置已经跑偏了。

修法：新增 `spawn_home`（传送到本阵营出生点 + `spawnpoint` 写死在那里），在四个时机都刷一次：

| 时机 | 位置 |
|---|---|
| 死亡（`death.mcfunction`） | 立刻拉回本阵营出生点 |
| 回合开始（`round_start`） | 全员归位 + 刷新重生点 |
| 选队（`team/join_t` `join_ct`） | 选完边就站到自家出生点 |
| 读档 / 切地图（`map/load_go`） | 刷新重生点 |

另外加了兜底 `respawn_guard`：比赛进行中如果有人带着 `cs2d.dead` 却不是旁观模式（点了重生按钮 / 瞬时重生抢跑），`player_tick` 会把他抓回旁观并送回出生点。

### 2. 安放 3.25 秒 / 拆除 5 秒·10 秒

| 项 | 值 | 改哪里 |
|---|---|---|
| 安放 | **3.25 秒 = 65 tick** | `#plantt`（load 里的默认值）与 bossbar `cs2d:plant` 的 max 同步改成 65 |
| 拆除（有拆弹钳） | **5 秒 = 100 tick** | `defuse_go`：`cs2d.def = 100`，bossbar max 100 |
| 拆除（无钳） | **10 秒 = 200 tick** | `defuse_go`：`cs2d.def = 200`，bossbar max 200 |

`defuse_tick` 统一每 tick 减 1，时长完全由 `defuse_go` 决定，bossbar 进度条不会只走一半。

同时删掉了「在包点内 —— 按住潜行」那条 actionbar 提示。

### 3. 购买书按阵营分版

`cs2d:buy_menu` 变成分发器：`team=T → cs2d:buy_menu_t`，`team=CT → cs2d:buy_menu_ct`。**买不了的枪根本不出现在书里**，不用再判断阵营、也不用看「仅限某阵营」的灰字。

| | T 的书 | CT 的书 |
|---|---|---|
| 步枪 | AK-47 $2700 / Galil AR $1800 | M4A4 $3000 |
| 手枪 | Glock-18 $200 / Desert Eagle $700 | USP-S $200 / Desert Eagle $700 |
| 冲锋枪 | MAC-10 $1050 | MP9 $1250 |
| 狙击 / 霰弹 | AWP $4750 | AWP $4750 / MAG-7 $1300 |
| 装备 | Kevlar $650 / Kevlar+Helmet $1000 | 同上 + Defuse Kit $400 |
| 投掷物 | Flashbang / HE / Smoke / **Molotov** | Flashbang / HE / Smoke / **Incendiary** |

### 4. 排版：一行一条，价格对齐

之前靠 10 个空格硬撑换行，比例字体下会错位、还会把一行拆成两行。现在改成**真实换行**：

- NBT 字符串只认 `\\` 和 `\"`，写 `\n` 会让整个函数加载失败 —— 所以书改由**战利品表**产出（`data/cs2d/loot_tables/buy_t.json` / `buy_ct.json`），JSON 文件里能合法写出换行。
- 转义链路：JSON 文件 `\\\\n` → NBT 源码 `\\n` → NBT 字符串 `\n` → Gson 解析成真换行。脚本里用常量 `NL` 统一处理，**不要手改**。
- 排版按 Minecraft 默认字体的字符像素宽度计算：枪名补空格到 76px，价格从同一列开始，整行 ≤ 108px（书页换行宽度是 114px），保证一条一行。

每页顶部显示 `CS2 BUY - T` + 当前金钱（score 组件），底部一条分隔线和「点击枪名购买」。

### 改动文件

新增：`spawn_home`、`respawn_guard`、`buy_menu_t`、`buy_menu_ct`、`loot_tables/buy_t.json`、`loot_tables/buy_ct.json`、`gen_fix7.py`（幂等）。
改动：`death`、`player_tick`、`round_start`、`team/join_t`、`team/join_ct`、`map/load_go`、`plant_try`、`plant_go`、`load`、`bomb_plant`、`zone_plant_check`、`defuse_go`、`defuse_tick`、`diag`、`buy_menu`（改为分发器）。改前备份在 `_bak_before_fix7/`。

`tools/validate.py` 新增两项：**战利品表引用悬空**检查 + **set_nbt 里的非法转义**检查（都做过反例测试，确实能报出来）。

## 三之八、CT 拆包改为蹲着长按 + HUD 去掉护甲（2026-09-26 第三轮）

### 1. 拆包：靠近炸弹蹲住

之前要 `/trigger cs2d.defl set 1`，而且**没买拆弹钳就直接拒绝拆除** —— 这跟 CS2 不一样（CS2 里没钳只是慢一倍，10 秒，不是不能拆）。现在改成和下包对称的操作：

**站到炸弹 3 格内，按住潜行（Shift）别松手** —— 有钳 5 秒、无钳 10 秒，bossbar `cs2d:defuse` 走进度条，每 0.5 秒一声滴答 + 一团火花（附近 16 格内的人也听得见，T 能靠声音判断）。

中断条件：松开蹲 / 走出 3 格 / 死亡 / 回合结束 / 强制停止。中断后进度归零，得重新蹲满。蹲下判定同样做了双保险（`nbt={Sneaking:1b}` + `sneak_time` 增量）。

`/trigger cs2d.defl set 1` 不再直接拆，改成**自检器**：逐条告诉你卡在哪（不在回合中 / 不是 CT / 没有已安放的炸弹 / 离炸弹太远），全绿就提示「就位 —— 按住潜行 5 秒（或 10 秒）拆除」。

### 2. 提示只给拆包者看 + 音效

全程 `title @s actionbar`，只有本人看得到：

| 时机 | actionbar | 音效 |
|---|---|---|
| 起手 | `拆除中… 保持蹲着（5 秒 / 10 秒）` | note_block.hat（音量 2） |
| 每 0.5 秒 | 续一次同一句（actionbar 会淡出，得补发） | 滴答（音量 1.6）+ 火花粒子 |
| 中断 | `拆除中断` | note_block.bass 低音 |
| 完成 | `炸弹已拆除 +$300` | 全场 pling |

HUD 每秒刷新会顶掉 actionbar，所以 state 2 的金钱行加了 `unless entity @s[tag=cs2d.defusing] unless entity @s[tag=cs2d.planting]` —— 拆包/下包期间不再被刷掉。

### 3. 不再显示护甲

actionbar 里的「护甲 N」整段删掉了（原版护甲条已经显示了，重复）。现在 actionbar 只剩 `$金钱`。

### 改动文件

新增：`defuse_try`、`gen_fix8.py`（幂等）。
重写：`defuse_go`、`defuse_tick`、`defuse_cancel`、`defuse_done`、`bomb_defuse`。
改动：`player_tick`（接入 + 修复时序）、`load`（新增 `#deftk` / `#deftn` 常量）、`hud`、`round_start`。改前备份在 `_bak_before_fix8/`。

> 时序坑：`defuse_tick` 原来排在文件末尾、`cs2d.snk0` 基准刷新之后，导致「sneak_time 增量」这个备判据永远为 false。现在 `defuse_try` / `defuse_tick` 都排在 snk0 刷新之前。

## 三之九、队伍可见性：敌方不显示名字 / 队友 X 光（2026-09-26 第四轮）

### 1. 名字牌：只给同队看

`load.mcfunction` 里给两个队伍各加一条：

```mcfunction
team modify T  nametagVisibility hideForOtherTeams
team modify CT nametagVisibility hideForOtherTeams
```

效果：CT 只看到 CT 的名字牌、T 只看到 T 的名字牌，**看不到对面**，也看不到没选阵营的人。
顺带加了 `seeFriendlyInvisibles true`（同队有人隐身时仍能看到半透明队友）。

> 注意：没选阵营（旁观/等待）的人对所有人来说都属于「其它队伍」，所以他们的名字牌谁都看不见 —— 这是预期行为，选好阵营就有了。

### 2. 队友 X 光 = 队伍色发光轮廓

新增 `xray.mcfunction`，每秒给「已选阵营 + 非旁观」的玩家续 3 秒 `glowing`：

```mcfunction
execute if score #xray cs2d.g matches 1 run effect give @a[team=CT,gamemode=!spectator] minecraft:glowing 3 0 true
execute if score #xray cs2d.g matches 1 run effect give @a[team=T,gamemode=!spectator] minecraft:glowing 3 0 true
```

轮廓颜色自动取队伍色：**CT 蓝 / T 金**，穿墙可见 —— 这就是 CS2 里队友轮廓的效果。
死亡（变旁观）时 `death.mcfunction` 的 `effect clear @s` 会立刻把轮廓去掉；强制停止走 `stop.mcfunction` 的全员 `effect clear`。

**引擎限制（必须知道）**：`glowing` 是实体的一个状态位，客户端对**所有**观察者都渲染轮廓，原版没有「只对本队渲染」的接口（队伍只能控制名字牌可见性和「能否看穿隐身队友」）。所以严格意义上的「只有同队看得到」做不到，敌方同样会看到轮廓。**不想要就关掉。**

### 3. 开关

| 方式 | 命令 |
|---|---|
| 管理书按钮 | 第⑥页「队友 X 光 开/关」 |
| trigger | `/trigger cs2d.ctrl set 97` |
| 直接改变量 | `/scoreboard players set #xray cs2d.g 0`（0=关，1=开，默认 1） |

### 改动文件

新增：`xray.mcfunction`、`xray_toggle.mcfunction`、`gen_fix11.py`（幂等，可重跑）。
改动：`load`（队伍可见性 + `#xray` 常量）、`tick_second`（每秒续）、`ctrl`（97 分支）、`team/join_ct`、`team/join_t`（选队后立刻生效）、`round_start`、`map/book`（管理书加按钮）。改前备份在 `_bak_before_fix11/`。

## 三之十、快捷栏槽位强制 + C4 掉落规则 + 死亡掉落（2026-09-26 第五轮）

### 1. 槽位表（1 号位 = hotbar.0）

| 格子 | 内容 | 备注 |
|---|---|---|
| 1 | 主武器 | 步枪 / 冲锋枪 / 狙击 / 霰弹 |
| 2 | 手枪 | Glock / USP / Deagle |
| 3 | 刀 | 爪刀 |
| 4 | 闪光弹 | **每类道具各 1 个**（闪光弹也从 2 个改成 1 个） |
| 5 | 高爆手雷 | 各 1 个 |
| 6 | 烟雾弹 | 各 1 个 |
| 7 | 燃烧瓶 / 燃烧弹 | 各 1 个 |
| 8 | C4（只有匪有） | 警察拿到会被没收 |
| 9 / 副手 / 背包 27 格 | **禁止放任何东西** | 每秒扫一次，扫到即清空 |

拆弹钳不再给物品（背包禁用，没地方放），只走 `cs2d.kit` 记分板 —— 拆除时长照旧读它。

### 2. 怎么强制的

每件发放的物品都带一个 NBT 标记 `cs2d_s:Xb`（X = 它该在的那一格）。新增 `inv_fix.mcfunction`，定期（默认 **0.2 秒**）对每人跑一次：

- **归位**：`Inventory[{Slot:5b,tag:{cs2d_s:0b}}]` —— 主武器跑到了 6 号格，就 `item replace hotbar.0 from hotbar.5` 搬回去，源格清空。目标格已经有东西就**替换掉**（这就是 CS2 捡枪的语义，不会叠加成两把）。
- **清空**：第 9 格、副手（Slot `-106b`）、背包 27 格（Slot 9b~35b）一律 `with minecraft:air`。
- **C4 只有匪能拿**：`execute if entity @s[team=!T] run clear @s ...{cs2d_c4:1b}`。
- **记录同步**：道具用掉了就把 `cs2d.nf/nh/ns/nm` 归零（下回合不白送回来）；主武器格空 → `cs2d.w1` 归零（下回合得重买）；捡了别人的枪 → `cs2d.w1/w2`跟着更新，下回合留着。

> 代价：手动把枪拖到别的格子会丢那把枪（归位是覆盖语义）。正常游戏不会这样操作。

### 2b. 扫描时机 + 局外生效（fix21）

**执行链**（不再挂在 `tick_second` 上）：

```
minecraft:tick 标签 → cs2d:tick（引擎保证每 tick 执行，不会因为 /reload 之类的原因断掉）
                        └─ 每 #invhz tick（默认 4 = 0.2 秒）→ cs2d:inv_scan
                              ├─ as @a → cs2d:inv_fix   槽位归位 / 清空 / 类型检查
                              └─ as @a → cs2d:inv_out   局外额外约束
```

| 常量 | 默认 | 含义 |
|---|---|---|
| `#invhz` | 4 | 扫描间隔（tick）。嫌开销大就 `/scoreboard players set #invhz cs2d.g 20`（回到 1 秒一次） |
| `#invout` | 1 | 局外（`#state` 不是 1..4）是否也约束：没收枪/刀/雷/C4 + 强制冒险模式。设 0 关闭 |
| `#invstrict` | 1 | 是否严格检查「每格只放该放的东西」。设 0 只做归位，不按类型清 |

**为什么改成这样**：原来只有 `tick_second` 一条 `schedule` 自调度链在调 `inv_fix`，链一断（`/reload`、热重载、schedule 丢失）整条约束就哑火，而且 1 秒才扫一次，拖进去的东西要等 1 秒才弹回，看着就像"没生效"。

- **看门狗** `wd.mcfunction`：`cs2d:tick` 每 tick 给 `#hb` +1，`tick_second` 每秒把它清零；连续 2 秒（40 tick）没清零就 `schedule clear` + 重新调度，自愈。`/function cs2d:diag` 会打出心跳值（>20 就说明链断过）。
- **局外**（未开局 / 已强制停止）：`inv_out` 没收 `tacz:modern_kinetic_gun` / `lrtactical:melee` / `lrtactical:throwable` / 带 `cs2d_c4` 的红石块，并把生存模式拉回**冒险模式**（不能破坏/放置方块；创造、旁观不动，方便管理）。`stop` 里原来给的是 survival，同步改成 adventure。
- **类型检查**（`inv_fix` 第 ⑥ 段）：每格只允许放它该放的东西，别的直接清掉，书（`minecraft:written_book`）除外——选队书和管理书要留着翻。1/2 号位允许 TaCZ 枪，3 号位 `lrtactical:melee`，4~7 号位 `lrtactical:throwable`，8 号位 `minecraft:redstone_block`。
  > 护甲槽（头盔/胸甲/腿甲/靴子）**故意不动** —— 时装工坊可能往那里放东西，清了会出乱子。

### 3. C4 掉了只有匪能捡

原版拾取**没法按队伍区分**（谁走到上面都能捡），所以整个接管：

1. 每 tick `kill @e[type=item,nbt={Item:{tag:{cs2d_c4:1b}}},tag=!cs2d.c4drop]` —— 没被接管的 C4 实体一律销毁。
2. 携带者死亡时 `c4_drop`：在死亡点生成一个**锁定拾取**的掉落物（`cs2d.c4drop`）：

   ```mcfunction
   summon minecraft:item ~ ~0.3 ~ {Tags:["cs2d.c4drop"],PickupDelay:32767s,Age:-32768s,
     CustomName:'{"text":"C4 炸弹","color":"red","bold":true}',CustomNameVisible:1b,
     Item:{id:"minecraft:redstone_block",Count:1b,tag:{cs2d_c4:1b,...}}}
   ```

   - `PickupDelay:32767` 每 tick 重置 → **任何人（含 CT）都捡不起来**；
   - `Age:-32768` 每 tick 重置 → 不会 5 分钟后消失；
   - 掉落物本体**看得见**（红石块 + 头顶「C4 炸弹」），所以不存在"掉地上找不到"的问题。
3. 掉落点再叠一个发光的红石块 `block_display`（tag `cs2d.c4fx`，`Glowing:1b`）——穿墙也能看见轮廓。
4. T 走到掉落物 2 格内 → `c4_take` 发到 **8 号位**，掉落物和光块一起清掉，全场提示「捡起了 C4」。
5. 保险：每 tick 再 `clear @a[team=!T] ...{cs2d_c4:1b}`（防止同 tick 内被捡起来了）。

> **携带者死亡时不弹任何文字/音效**（CS2 也没有"某某把包掉了"的播报）。
> 捡起时的「XX 捡起了 C4」是另一条提示，CS2 里也有，默认保留（不想要就删 `c4_take` 的 tellraw）。
> 清理点：捡起 / 回合开始 / 回合结束 / 强制停止。
5. 回合开始 / 结束 / 强制停止都会清掉 marker 和残留掉落物。

### 4. 死亡掉枪掉道具

`load.mcfunction` 里 `gamerule keepInventory false` —— 死了原版就把身上的东西全掉在地上，别人可以捡（捡起来按上面第 2 条归位=替换）。回合结束 / 停止时会把地上带 `cs2d_s` 标记的装备清空，免得下一回合堆一地枪。

### 改动文件

新增：`inv_fix.mcfunction`、`c4_drop.mcfunction`、`c4_tick.mcfunction`、`c4_take.mcfunction`、`gen_fix12.py`（幂等）。
重写：`buy_menu_t` / `buy_menu_ct`（旧成书菜单已废弃，转发到聊天栏）。
改动：`load`（keepInventory）、`tick`（c4_tick）、`tick_second`（inv_fix）、`death`（掉 C4）、`round_start`（C4 → 8 号位 + 清场）、`round_end`、`stop`、`kit/apply`、`knife`、`nade/*`、`gun/*`、`buy/grant_*`、`buy/un_*`、`buy/flash`（上限 1）、`buy/grant_kit`、`buy/un_kit`（钳子去物品化）。改前备份在 `_bak_before_fix12/`。

## 三之十一、玩家列表（Tab）显示伤害 / K-D

按 Tab 打开玩家列表，每个人名字右边会多一个黄色数字。

**四种显示模式**（管理书第⑥页「列表 伤害/KD」按钮循环切换，或 `/trigger cs2d.ctrl set 96`）：

| 模式 | 含义 | 例子 |
|---|---|---|
| **3（默认）** | **本场造成的伤害**（CS2 口径） | `486` |
| 2 | 击杀数 ×1000 + 死亡数 | `12005` = 12 杀 5 死 |
| 1 | K/D 比值 ×100 | `240` = 2.40 |
| 0 | 关闭（列表不显示分数） | — |

> Tab 列表只有一列整数，放不下「12 / 5」两个数字，所以模式 2 用编码：前几位是击杀，末三位是死亡。

### 伤害是怎么算的（2026-09-26 改）

`minecraft.custom:minecraft.damage_dealt` 是**玩家终身统计**，而 criteria 类型的记分板
**不能靠 `scoreboard players reset` 清零** —— reset 只删掉记分板里的条目，下次造成伤害时
整个统计值会被原样写回来（比如累计 500 被 reset 成 0，再打 1 下又变 510）。

所以本场伤害 = **当前累计 − 开赛时的基线**：

| 记分板 | 作用 |
|---|---|
| `cs2d.dmg` | `damage_dealt` 自动累计，只读 |
| `cs2d.dmg0` | 开新比赛 / 重进时登记的基线 |
| `cs2d.dmgv` | 本场伤害 = `(dmg − dmg0) ÷ #dmgdiv` |
| `cs2d.kd` | 列表显示值（模式 3 时 = `dmgv`） |

**单位换算**：`damage_dealt` 以 0.1 个 MC 伤害点为单位，MC 20 血 = CS2 100 血
→ CS2 伤害 = MC 伤害 × 5 = `damage_dealt ÷ 2`。`#dmgdiv` 默认 2，
想看原版数值就 `/scoreboard players set #dmgdiv cs2d.g 1`。

**统计口径**

- 新开一场比赛（`match_start`）时伤害归零（重新登记基线）—— 跟 CS2 一样是**本场**数据。
- 中途重进服务器不会清零（基线存在世界里，按玩家名保留）。
- 击杀 / 死亡：TK 不加击杀数，被 TK 的人照常计一次死亡。
- 数据记在 `cs2d.tk`（总击杀）/ `cs2d.td`（总死亡）里。
  注意 `cs2d.kills` 是**本回合**击杀、`cs2d.deaths` 每 tick 被 reset（只当死亡检测开关），都不是累计值。

**查看自己的战绩**：管理书第⑥页「我的战绩」按钮，或 `/trigger cs2d.ctrl set 95`（会同时报伤害）。

## 三之十二、MR12：13 回合胜利 / 12 回合换边 / 加时（2026-09-26 第六轮）

规则对齐 CS2 竞技：

| 阶段 | 触发 | 行为 |
|---|---|---|
| 上半场 | 第 1~12 回合 | 正常打 |
| **换边** | 打完 12 回合（第 13 回合开始） | 双方互换阵营 |
| 下半场 | 第 13~24 回合 | 先到 **13 分**获胜 |
| 加时 | 24 回合打完 **12:12** | 先到 **16 分**，每 **3 回合**换一次边 |

换边做 6 件事（都在 `swap_sides.mcfunction`）：

1. 玩家换队（经 `cs2d_tmp` 中转，避免互换时互相覆盖）
2. **比分跟着人走**：`cs2d:score_swap` 交换 `T` / `CT` 的 `cs2d.wins`
3. 立刻 `spawn_home` 把人送到新阵营的出生点
4. **经济重置**：常规赛回到起始 `$800`，加时 `$10000`（CS2 中场休息的经济规则）
5. 连败补偿阶梯清零（`#lossT` / `#lossCT`）
6. 阵营限定记录清零：`cs2d.kit`（拆弹钳）、`cs2d.w2`（手枪按新阵营重发）

> ⚠️ **地图不动**（2026-09-26 修复）。CS2 里出生点和包点都是**地图固定**的：
> 换边后 T 从「地图上的 T 出生点」出发，而不是从「上半场 CT 的出生点」出发。
> 所以 `swap_sides` **只换玩家的队伍**，不交换区域坐标、也不交换出生点 marker ——
> `spawn_home` 会按新阵营把人送到地图对应的 marker。
>
> 早期版本把「区域坐标 + marker + 队伍」三样一起换，交换是对合运算，换两次 = 没换，
> 结果双方都还站在原地、高光方位也是反的。
> **已经换过边的存档，部署新包后执行一次 `/function cs2d:map/unswap` 复原**（只跑一次）。

### 比分为什么要在换边时交换

`cs2d.wins` 记在阵营名 `T` / `CT` 上，但 CS2 的记分板记的是「人」的累计分。
换边后这批人换了阵营，他们上半场拿的分要跟着走到新阵营栏，否则自己打出来的分
会显示在对手那一侧。想让分数固定在阵营名下（不随人走）：

```mcfunction
/scoreboard players set #swapscore cs2d.g 0
```

### 调参常量

| 常量 | 默认 | 含义 |
|---|---|---|
| `#halfr` | **12** | 半场回合数 —— 打满这么多回合换边，`load` / `match_start` 无条件写 12 |
| `#target` | **13** | 目标分（先到 13 分获胜），同样无条件写 13；进加时后由 `overtime` 改成「当时分数 +4」 |
| `#oth` | 3 | 加时每几回合换边（CS2 MR3） |
| `#half` | 0/1 | 0=上半场 1=已换过边 |
| `#ot` | 0/1 | 是否加时赛 |
| `#otbase` | — | 进入加时那一刻的 `#round`，加时换边的基准 |

赛制是写死的，**不用手动初始化**：每次 `load`（开服）和 `match_start`（开新比赛）都会
强制把 `#halfr` 写成 12、`#target` 写成 13，存档里残留的旧值不会生效。

想临时打成别赛制，直接在游戏里改这两个值即可，当场比赛有效（重开服会回到 12/13）：

```mcfunction
/scoreboard players set #halfr cs2d.g 8      # MR8：8 回合换边
/scoreboard players set #target cs2d.g 9     # 先到 9 分
```

要**永久**改成 MR8，把 `load.mcfunction` 和 `match_start.mcfunction` 里那两行
`scoreboard players set #halfr cs2d.g 12` / `#target … 13` 一起改掉（两个文件都要改，
否则下一场比赛会被 `match_start` 拉回 13）。

### 加时换边怎么算的

```
#otm = #round - #otbase - 1
#otm % #oth == 0  →  换边
```

`#otbase` = 24（常规赛打完），加时第一半场是第 25/26/27 回合，第 **28** 回合换边
（28-24-1 = 3，3 % 3 = 0）。加时赛开始时会先换一次边，之后每 3 回合一次。

## 三之十三、枪械扩充：补齐 CS2 其余枪械（2026-09-26 第七轮）

### 1. 服务器上实际有哪些枪包（日志实证）

```
[tacz/GunPackFinder] Start scanning for gun packs in <服务端目录>\tacz
[tacz/GunPackFinder] - CS2 Knifes Pack v1.0.1.zip, Main namespace: cs2_wt
[tacz/GunPackFinder] - CS2 Pack 枪与刀 v0.01.zip,  Main namespace: cs2_wt
[tacz/GunPackFinder] - daffas,                     Main namespace: daffas_arsenal
[tacz/GunPackFinder] - lradd_default_gun,          Main namespace: lradd
[tacz/GunPackFinder] - tacz_default_gun,           Main namespace: tacz
[tacz/GunPackFinder] Found 5 possible gunpack(s)
```

**关键发现**：`cs2_wt`（CS2 枪包）**只有 10 把枪** —— `ak47 / awp / deagle / galilar / glock_18 / m4a1 / mac10 / mag7 / mp9 / usp`，
外加 10 把刀（`bayonet / butterfly / css / karambit / m9 / push / skeleton / stiletto / tactical / talon`）。
CS2 里剩下那一大半枪（AUG、SG553、FAMAS、M4A1-S、SSG08、SCAR-20、G3SG1、MP5-SD、UMP-45、P90、野牛、Nova、XM1014、截短、M249、Negev、P250、Five-SeveN、Tec-9、CZ75、双持、R8）**cs2_wt 里根本没有**，只能从另外三个包里挑外形最接近的顶上。

`lradd_default_gun` 这个包里其实有两套：`lradd`（29 把，主命名空间）和 `lrl`（47 把，CS2 皮肤命名：二西莫夫/反冲精英/墨冰…）。

### 2. 映射表（CS2 枪 → 实际发的 GunId）

| CS2 枪 | 价格 | 阵营 | 实际 GunId | 来源包 |
|---|---|---|---|---|
| AK-47 | $2700 | T | `cs2_wt:ak47` | cs2_wt（原样） |
| Galil AR | $1800 | T | `cs2_wt:galilar` | cs2_wt |
| **SG 553** | $3000 | T | `lradd:sg553` | lradd |
| **G3SG1** | $5000 | T | `lradd:g3_sg2` | lradd（G3 SG/2 狙击型） |
| M4A4 | $3000 | CT | `tacz:m4a1` | tacz（M4A1 无消音） |
| **M4A1-S** | $2900 | CT | `cs2_wt:m4a1` | cs2_wt（消音 M4A1） |
| **FAMAS** | $2050 | CT | `lradd:famas` | lradd（三连发 BURST） |
| **AUG** | $3300 | CT | `lradd:aug` | lradd |
| **SCAR-20** | $5000 | CT | `tacz:scar_h` | tacz（SCAR-H） |
| AWP | $4750 | 双方 | `cs2_wt:awp` | cs2_wt |
| **SSG 08** | $1700 | 双方 | `daffas_arsenal:ssg69` | daffas（SSG 69 栓动狙） |
| MAC-10 | $1050 | T | `cs2_wt:mac10` | cs2_wt |
| MP9 | $1250 | CT | `cs2_wt:mp9` | cs2_wt |
| **MP5-SD** | $1500 | 双方 | `tacz:hk_mp5a5` | tacz（MP5A5） |
| **UMP-45** | $1200 | 双方 | `lrl:ump45_crimson_foil` | lrl |
| **P90** | $2350 | 双方 | `lradd:p90` | lradd |
| **PP-野牛** | $1400 | 双方 | `lradd:pp19` | lradd |
| MAG-7 | $1300 | CT | `cs2_wt:mag7` | cs2_wt |
| **Nova** | $1050 | 双方 | `tacz:m870` | tacz（M870 泵动） |
| **XM1014** | $2000 | 双方 | `tacz:m1014` | tacz（M1014） |
| **截短霰弹枪** | $1100 | T | `tacz:db_short` | tacz（短管双管） |
| **M249** | $5200 | 双方 | `tacz:m249` | tacz（M249） |
| **Negev** | $1700 | 双方 | `tacz:rpk` | tacz（RPK） |
| Glock-18 | 默认 | T | `cs2_wt:glock_18` | cs2_wt |
| USP-S | 默认 | CT | `cs2_wt:usp` | cs2_wt |
| Desert Eagle | $700 | 双方 | `cs2_wt:deagle` | cs2_wt |
| **P250** | $300 | 双方 | `lradd:p250` | lradd |
| **Five-SeveN** | $500 | CT | `lrl:p320_doctor` | lrl（P320） |
| **Tec-9** | $500 | T | `tacz:uzi` | tacz（UZI） |
| **CZ75-Auto** | $500 | 双方 | `tacz:cz75` | tacz（CZ 75） |
| **双持贝瑞塔** | $300 | 双方 | `tacz:b93r` | tacz（B93R 三连发） |
| **R8 左轮** | $600 | 双方 | `tacz:rhino357` | tacz（.357 Rhino） |

**没做的**：Zeus x27（电击枪，一次性，枪包里没有对应物）。

### 3. 加了哪些文件

一把枪 = 4 个函数，全部由 `gen_fix22.py` 批量生成（22 把 × 4 = 88 个新文件）：

| 文件 | 作用 |
|---|---|
| `gun/<key>.mcfunction` | 发放：带 `cs2d_s` 槽位标签 + 弹匣/备弹/开火模式 |
| `buy/<key>.mcfunction` | 判定：阵营限制 → 防重复 → 金钱够不够 |
| `buy/grant_<key>.mcfunction` | 扣钱 + 写 `cs2d.w1/w2` 记录 + 写 `cs2d.lb/lbp`（供退款） |
| `buy/un_<key>.mcfunction` | 退款：清记录 + `clear` 掉那把枪 + 退钱 |

外加挂接：`buy/go`（购买分发）、`buy/refund_go`（退款分发）、`kit/apply`（每回合按记录重发）、
`inv_fix`（捡到别人的枪时同步记录，否则下回合装备会丢）、`buy/chat_t`、`buy/chat_ct`（聊天栏菜单重写，按阵营只显示能买的）。

### 4. 记录编码

| 记录 | 值 |
|---|---|
| `cs2d.w1`（主武器） | 1=MAC-10 2=MP9 3=Galil 4=AK-47 5=M4A4 6=AWP 7=MAG-7 8=SG553 9=AUG 10=FAMAS 11=SSG08 12=SCAR-20 13=G3SG1 14=M4A1-S 15=MP5-SD 16=UMP-45 17=P90 18=野牛 19=Nova 20=XM1014 21=截短 22=M249 23=Negev |
| `cs2d.w2`（手枪） | 0=阵营默认手枪 2=Deagle 3=P250 4=Five-SeveN 5=Tec-9 6=CZ75 7=双持 8=R8 |
| 购买码 | 24~39 主武器、40~45 手枪（10~23 是原有的枪和投掷物，50~52 装备，98/99 菜单/退款） |

> ⚠️ **手枪清零逻辑改过**：原来是「2 号位有东西但不是 Deagle → `w2 = 0`」，会把新买的 P250 等直接抹掉。
> 现在改成「`w2` 等于 N 但手上不是第 N 把手枪 → 才清零」，每种手枪一条。

## 三之一、区域 + 多地图管理

**最快的用法：拿一本管理书，全程点击，不需要 OP 权限。**

```
/function cs2d:book              # 拿地图管理书（= /function cs2d:map/book）
/function cs2d:diag              # 自检：包加载了吗 / 当前状态 / 比分 / 区域是否设好```

书里六页：① 正方形标法（站中心点）② 任意矩形（对角两点）③ 调范围 / 高光 ④ 选地图槽位 1~8 ⑤ 保存 / 加载 / 删除 / 命名 ⑥ 开始 / 强制停止。

等价的命令行（OP 用）：

```
# 标法一：站在中心执行，以自己为中心、半径 #rad 画正方形
/function cs2d:map/set_zone_t      # T 出生区（红）
/function cs2d:map/set_zone_ct     # CT 出生区（青）
/function cs2d:map/set_zone_a      # A 包点（橙）
/function cs2d:map/set_zone_b      # B 包点（绿）

# 标法二：对角两点，任意长宽（#zedit 决定改哪个区：1=T 2=CT 3=A 4=B）
/function cs2d:map/p1             # 记录角①（站角上）
/function cs2d:map/p2             # 记录角② → 生成矩形（站对角上）

/function cs2d:map/save           # 把当前四个区域存进当前槽位
/function cs2d:map/list           # 列出所有已保存地图
/function cs2d:map/load           # 加载当前槽位的地图（并把两队传送过去）
/function cs2d:map/delete         # 删除当前槽位
/function cs2d:map/name           # 用手持物品的名字给当前槽位命名（铁砧改名后拿着执行）
/function cs2d:map/rad_up         # 所有区域整体外扩 1 格
/function cs2d:map/rad_down       # 所有区域整体内缩 1 格
/function cs2d:map/redraw         # 重绘高光
/function cs2d:map/zone_clear     # 只清高光，坐标保留
```

**换地图的标准流程（自建房场景）**：
选槽位 → 走到新房子里标 4 个区域 → `save` → 下次想玩就选槽位 → `load`（区域范围、出生点、高光全部恢复，两队直接传送过去）。

- 半径：只影响「正方形」那种标法，`/scoreboard players set #rad cs2d.g 5`（默认 3 → 7×7）。
- 垂直范围固定为脚下 1 格 ~ 头顶 3 格（对角法取两角 y 的最小/最大值再各自外扩）。
- 槽位：默认 1，切换 `/scoreboard players set #slot cs2d.g 3`（书里点更快）。
- 高光：半透明发光玻璃地面 + 悬浮文字标签，**矩形会自动画成长方形**。配色（玻璃 / 文字）：

  | 区域 | 玻璃 | 标签文字 |
  |---|---|---|
  | T 出生区 | 红 `red_stained_glass` | `#E88A8A` 柔红 |
  | CT 出生区 | 青 `cyan_stained_glass` | `#86CFE0` 柔青 |
  | A 包点 | 橙 `orange_stained_glass` | `#E8C070` 柔琥珀 |
  | B 包点 | 绿 `lime_stained_glass` | `#8FD98F` 柔绿 |

  嫌刺眼/嫌暗就改 `map/fx_*.mcfunction` 里 `text:'{...color...}'` 的十六进制值；玻璃亮度改同一行的 `glow_override`（0~15，默认 15 全亮不受光照）。

- **管理书 / 购买菜单的 UI 配色**（成书页面背景是浅色羊皮纸，亮色会刺眼，已全部换成中等深度）：

  | 用途 | 原色 | 现色 | 出现位置 |
  |---|---|---|---|
  | 可点击的操作按钮（角①角②、外扩、内缩、命名） | `yellow` `#FFFF55` 荧光黄 | `#3F7FA6` 柔和蓝 | `map/book.mcfunction`、`buy_menu.mcfunction` |
  | 章节标题「①~⑥」、A 包点按钮、当前槽位 | `gold` `#FFAA00` 亮金 | `#C08A2E` 柔和琥珀 | 同上 |

  想再调就全局替换这两个十六进制值（各文件内 sed/replace 即可）。注意：`white` 在羊皮纸底上对比度偏低（重绘/清除/槽位 2~8 用的是它），若觉得看不清可换成 `dark_gray`。
- 地图记录存在 marker 实体 NBT 里（槽位号记在 `cs2d.mslot`），每区存 6 个坐标，随世界存档，重启不丢。
- 安放炸弹判定的是**包点矩形范围**；冻结阶段跑出出生区会被拉回。
- 坐标变量：`#tx1/#ty1/#tz1 ~ #tx2/#ty2/#tz2`（T）、`#cx1…`（CT）、`#ax1…`（A）、`#bx1…`（B）。

> **改高光时别踩这个坑**：`block_display` 是**从最低角向外生长**的（模型原点在方块的一角，不是中心），
> 所以玻璃必须生成在 **角1 `#x1,#y1+1,#z1`**，再靠 `scale` 撑到角2 —— 若生成在中心，整体会偏移半个区域宽，区域越大偏得越明显。
> 而 `text_display` 相反，**文字以实体位置居中**，所以标签要生成在区域中心。两者不同，别统一处理。
> 出生点 marker 用 `~0.5 ~ ~0.5`，因为整数坐标是方块角、站上去容易卡边。

### 两种标法

| 标法 | 什么时候用 | 怎么操作 |
|---|---|---|
| **正方形**（中心 + 半径） | 区域大概是方的，图快 | 站中心点「设为 X 区」，边长 = `#rad`×2+1 |
| **任意矩形**（对角两点） | 长宽不一样，比如狭长的包点、L 形走廊 | 先选区 → 站一个角点「记录角①」→ 走到对角点「记录角②」 |

对角法细节：

- 顺序无所谓，先点哪个角都行，内部会自动取 min/max。
- 记录角① 时会在那一格中心放一个**浅灰半透明小方块**（0.5 格、`glow_override:4`）做标记，选完角② 自动消失。
  嫌亮/嫌暗或想换颜色：改 `map/p1.mcfunction` 里 `block_state.Name` 和 `glow_override`（0~15）。
- 高度不用管，自动从脚下 1 格铺到头顶 3 格。
- 当前编辑区存在 `#zedit`（1=T 2=CT 3=A 4=B），命令行改：`/scoreboard players set #zedit cs2d.g 3`。

命令行等价写法：

```
/function cs2d:map/p1     # 记录角①（站角上）
/function cs2d:map/p2     # 记录角② 并按 #zedit 生成矩形（站对角上）
```

## 四、调参入口

| 想改什么 | 改哪里 |
|---|---|
| 胜利回合数 | `/scoreboard players set #target cs2d.g 13`（默认 3） |
| 开局人数 | `/scoreboard players set #minp cs2d.g 2` |
| 正方形半径（仅中心标法用） | `/scoreboard players set #rad cs2d.g 5`（默认 3） |
| 当前编辑区（对角法改哪个区） | `/scoreboard players set #zedit cs2d.g 3`（1=T 2=CT 3=A 4=B） |
| 冻结时间 | `round_start.mcfunction` 里 `#timer 8` |
| 回合时长 | `round_live.mcfunction` 里 `#timer 90` |
| 炸弹倒计时 | `bomb_planted.mcfunction` 里 `#bomb 40` |
| 拆除耗时 | `#deftk`（有钳，默认 100 = 5 秒）/ `#deftn`（无钳，默认 200 = 10 秒），改完重进即可 |
| 安放耗时 | `#plantt`（默认 65 = 3.25 秒） |

## 五、继续复刻的路线（枪械排在最后）

| 阶段 | 内容 | 状态 |
|---|---|---|
| 0 地基 | 计分板 / 队伍 / 状态机 / tick 调度 | demo 已完成 |
| 1 回合 | 冻结-对局-结算循环、全灭/时间判定、比分 | demo 已完成 |
| 2 经济+购买 | 金钱、连败补偿、trigger 菜单 | demo 有基础版（无连败补偿） |
| 3 炸弹 | 安放/拆除/爆炸/进度条 | demo 已完成 |
| 4 枪械 | TaCZ 集成：发枪、弹药、爆头、后坐力 | **已完成**：CS2 全枪械（32 把）已用服务器上 4 个枪包拼齐，见 §三之十三 |
| 5 打磨 | 连败补偿、MVP、声音、资源包 UI（半场换边已完成） | 部分完成 |

阶段 4 最关键的一点：**先保证逻辑层在"占位武器"下跑通，再换真枪**。真枪只影响 `buy_rifle`（发什么）和 `player_reset`（发什么手枪），不动状态机。

## 六、与旧包 `cs2_competitive` 的关系

- 旧包 69 文件，功能更全（连败补偿、MR13、双模式发枪），但卡在排查阶段、未验证通过。
- demo 是**重写的最小实现**，命名空间 `cs2d`、计分板 `cs2d.*`，两者可共存不冲突。
- 旧包那个 trigger 命名 bug（书里写 `cs2_buy`、计分板叫 `cs2.buy`）在 demo 里不存在，统一用点号。
- 逻辑验证通过后再往旧包回填，或者直接拿 demo 往上长。

## 七、故障排查

| 现象 | 原因 | 怎么办 |
|---|---|---|
| 提示 **"未知函数 cs2d:xxx"** | 数据包没被服务端启用（不在 enabled 列表里），或目录套了一层 | 见下面「安装自检」三步 |
| **包已启用、别的函数都能用，偏偏某一个报"未知函数"** | **该函数文件解析失败**，Minecraft 会把它从函数注册表里剔除。日志里会有 `Failed to load function cs2d:xxx` 加具体原因 | 见下面「单个函数加载失败」 |
| 点书本按钮提示 **"你尚无法触发这个记分项"** | trigger 计分板没对该玩家 `enable` | 执行一次 `/function cs2d:unlock`（新版已在 tick 里自动放开） |
| 书本点了没反应 | 同上，或当前阶段不允许该操作（如非冻结期买枪） | 先 `unlock`；再看 HUD 处于哪个阶段 |
| 拿到书但整页空白 / 显示无效 JSON | 书是旧版发的 | 重新拿一本：`/function cs2d:book` |
| 重启或 `/reload` 之后整个包像死了一样（不开始、不计分） | 旧版 `load.mcfunction` 用了裸 `objectives add`，第 6 行报"已存在"就中断了整个初始化 | **已修**（现为幂等写法），重新拷贝一次包即可 |
| 服务器日志刷屏 `Display entityNot a string` | **无害**。Mojang 已知 bug [MC-261036]，`/summon text_display` 带 `text` 标签时必刷这条，实体本身生成正常，标签照常显示 | 不用管。1.20.1 无法消除 |
| 开服时日志报 `Couldn't parse element loot_tables:cs2d:buy_t` | 战利品表 `set_nbt` 的 `tag` 是 **SNBT**，单引号字符串里再写 `\"` 就是非法转义 | 已修（`\\\"` → `\"`）。校验脚本第 4b 项会拦 |
| 玩家频繁 `lost connection: Timed out` | **先判是不是服务端卡**：翻日志看掉线那一刻前后，别人有没有在正常操作。别人照常买枪/切模式 ⇒ 服务端 tick 正常，是那一条连接断了（穿透/带宽/客户端） | 见下面「掉线怎么定位」 |
| `/reload` 之后被踢出世界 | **与 cs2d 无关**，是「时装工坊」Armourer's Workshop 3.4.0-beta.3 的 bug，详见下文 | 升级/移除该模组；或改完包重启服务端 |

### 安装自检：提示"未知函数"时按这三步查

**① 看包有没有被启用**

```
/datapack list
```

输出分两段：**`Enabled`（已启用）** 和 **`Available`（可用但未启用）**。必须看到 `file/tacz-cs2-datapack` 在 **Enabled** 那一段。

如果它在 Available 里（服务端运行时才放进 `datapacks` 目录的新包都会这样）：

```
/datapack enable "file/tacz-cs2-datapack"
```

**② 看目录有没有套娃**

正确的落点是：`world\datapacks\tacz-cs2-datapack\pack.mcmeta`

也就是说，打开 `tacz-cs2-datapack` 文件夹，**第一眼就要看到 `pack.mcmeta` 和 `data`**，而不是再看到一层 `tacz-cs2-datapack`。如果是后者（复制时把文件夹拖进了自己里面），把它拖出来一层即可。

**③ 确认包真的活了**

```
/function cs2d:diag
```

能刷出一堆状态就说明 `cs2d` 命名空间是活的；**连这条都报"未知函数"，就一定是 ①② 没过**。

### 单个函数加载失败：改完包先跑一遍离线校验

`cs2d:map/book` 曾经整本书发不出来，日志是这样：

```
[Server thread/ERROR] [net.minecraft.server.ServerFunctionLibrary/]: Failed to load function cs2d:map/book
java.lang.IllegalArgumentException: Whilst parsing command on line 3:
    Invalid escape sequence '\n' in quoted string at position 100
```

原因是书页里写了 `{"text":"\n"}` 想换行。**Minecraft 命令里的引号字符串只认两种转义：`\\` 和 `\"`，`\n` 是非法转义**，一行非法 → 整个函数文件加载失败 → 这个函数就等于不存在 → 执行时报"未知函数"。

书页**不需要手写换行**，它本来就会按页面宽度自动折行，把换行组件换成 `{"text":"  "}` 做间距即可。

这类问题在开服前就能查出来，不用上服务器试：

```
python tools/validate.py
```

（默认校验仓库根目录的数据包 —— 即 `pack.mcmeta` 所在处。也可以 `python tools/validate.py <数据包目录>`）

它会检查：**非法转义序列**、书页里残留的字面 `\n`、`function cs2d:xxx` 引用是否悬空、成书每页 JSON、**1.20.1 语法黑名单**、计分板引用、UTF-8 无 BOM、资源路径大小写。全部通过会打印"没有发现问题"。**每次改完包都跑一遍。**

### 三个真实踩过的「函数加载失败」坑（2026-09-26 一次日志里全中）

现象都是：`/function cs2d:book` **不报错**（日志还写 `Executed 1 command(s)`），但什么也没发生——因为它只转发给 `cs2d:map/book`，而那个函数压根没加载成功。所以要 grep 的是 `Failed to load function`，不是命令本身。

| 日志报错 | 真因 | 修法 |
|---|---|---|
| `Unclosed quoted string` | 成书 `pages:['…','…']` 最后一页**少了收尾单引号** | 补引号；结构必须是 `…}]'],title:`（引号在页数组 `]` 之后、pages 数组 `]` 之前） |
| `Incorrect argument for command … unless <--[HERE]` | 用了 `execute if\|unless items` —— **这是 1.20.2 才加的语法，1.20.1 没有** | 判断主手有无物品改用 `execute unless data entity @s SelectedItem{}`；判断某格用 `Inventory[{Slot:8b}]` |
| `Only one entity is allowed` | `attribute @a … modifier remove` —— attribute **只接受单个实体** | 改成 `execute as @a run attribute @s …` |
| `Invalid or unknown argument` / `Expected end of command` | **一行里被塞了两条命令**，形如 `kill @e[…{cs2d_c4:1b}}]kill @e[…]`（`]` 后面直接跟字母）。多半是生成器 patch 时插入内容忘了带换行 | 拆成两行。`tools/validate.py` 第 8 项会抓（`]` 紧跟字母即报错） |

### 「炸弹爆炸之后游戏没有结束」的真因（2026-09-26）

`round_end.mcfunction` 和 `stop.mcfunction` 各有一行上面第四种拼接命令（都是 gen_fix12 的 patch 漏了换行），
于是这两个函数**整文件加载失败**：

- `win_t` / `win_ct` 里 `function cs2d:round_end` 直接失败 → `#state` 永远停在 2 → 回合结束不了；
- `#bomb` 被减成负数后每秒都满足 `matches ..0` → **每秒再爆一次**；
- 同理 `cs2d:stop` 也失效（强制停止没反应）。

**这类 bug 的症状是"某条命令完全没反应"，而不是报错** —— 遇到"逻辑明明写了却没生效"，先怀疑那个函数是不是压根没加载成功（grep `Failed to load function`），再去翻逻辑。

修复脚本 `gen_fix15.py`（幂等）：拆分拼接行 + 去掉被重复插入的清场 kill 段（原来各 2 份）。

### 掉线怎么定位（2026-09-26 实查）

日志里掉线就三种写法，含义完全不同：

| 日志 | 含义 |
|---|---|
| `lost connection: Timed out` | 服务端 15 秒发一次 keepalive，下一次还没收到回包就踢。**网络断了**（丢包/延迟/客户端卡死） |
| `lost connection: Disconnected` | 客户端主动断开（退出游戏、崩溃、断网） |
| `lost connection: Flying is not enabled on this server` | 反作弊踢出。前一天面通常是 `XXX was kicked for floating too long!` —— **自己切创造模式飞了再切回生存**就会这样，原版机制，不是数据包问题 |

**关键判据：服务端有没有卡住。** 抓一条 `Timed out`，看它前后 60 秒里别人有没有在正常操作：

```
23:02:47  Steve lost connection: Timed out
23:02:49  [Alex: Triggered [购买] ...]     ← +2s
23:02:52  [Herobrine: Triggered [购买] ...]  ← +5s
```

别人照常买枪 ⇒ 服务端 tick 完全正常 ⇒ **只是那一条连接断了**，跟数据包、跟 TPS 都没关系。
反过来，如果**所有人**在同一两秒内一起 `Timed out`，那才是服务端卡了（会伴随 `Can't keep up` 或 watchdog 崩溃）。

已实测（4 份日志）：11 次 `Timed out` 里 8 次属于前一种。且**掉线次数跟在线人数强相关** —— 3 人在线时 0~4 次/10 分钟，第 4 人一进来就变成 11 次/10 分钟。所有连接的来源 IP 都是 `127.0.0.1`（走的是内网穿透代理），所以瓶颈在**主机上行带宽 / 穿透链路**，不在服务端。

能做的缓解（都在 `server.properties`，不在数据包里）：

- `view-distance=6`（默认 10）—— 最直接，区块数据量跟视距平方成正比；
- `network-compression-threshold=256`（默认 256，若被改成 -1 就关掉压缩反而更占带宽）；
- 同局域网的人**直连局域网 IP**，别绕穿透。

> `Timed out` 的判定阈值（15 秒发、下次 tick 检查）是服务端硬编码的，没有配置项能放宽。

### 不报错、但静默失效的坑：NBT 列表匹配

`@s[nbt={Inventory:[{id:"minecraft:redstone_block"}]}]` **不是**「背包里有没有红石块」，而是「背包**第 0 个**物品是不是红石块」——Minecraft 对列表的 NBT 匹配是**按下标对齐**的，不会去搜索整个列表。

所以只要 C4 不在背包第 0 格（give 追加进去的，几乎永远不在），这条判定恒为假，表现为「明明身上有 C4，系统却说没有」，而且**日志里一个字都不会报**。

查背包任意位置的物品用这两个之一：

- `execute store result score @s cs2d.c4 run clear @s minecraft:redstone_block{cs2d_c4:1b} 0` —— `clear ... 0` 只统计不移除（本包现在的做法）；
- `execute if data entity @s Inventory[{id:"minecraft:redstone_block"}]` —— NBT **路径**会遍历列表，这个才是「任意槽位」。

### 命令别名

`/function cs2d:book` 和 `/function cs2d:map/book` 完全等价（怕你少打 `map/` 前缀，加了根级别名）。
`/function cs2d:diag` 是自检用的，见上。

### 为什么 trigger 会"用一次就废"

Minecraft 的规则：`trigger` 类型的计分板，玩家每成功执行一次 `/trigger` 就会被**自动关闭**，必须用 `scoreboard players enable <玩家> <项>` 重新开放才能再点。而且这个开放状态在 `/reload`、重连、服务端重启后会丢。

书本按钮走的全是 `/trigger`（因为 `/function` 需要 OP 权限等级 2，普通玩家点不了），所以开放状态必须一直续上。

现在由 `unlock.mcfunction` 统一处理：

- `tick.mcfunction` 每 tick 调一次（有人在线时）——点完立刻重新开放，连点没问题；
- `load.mcfunction` 末尾调一次——`/reload` 后立刻恢复；
- 发书前（`map/book`、`buy_menu`）调一次——拿到书那一刻一定可用；
- `join.mcfunction` 调一次——新人进服即可用。

手动补一次：`/function cs2d:unlock`。

### 更新数据包：为什么不要用 `/reload`（真实原因，已查日志确认）

`/reload` 之后服务器重建命令树，并把新的命令树打成 `ClientboundCommandsPacket` 发给**每一个在线玩家**。发包时要逐个序列化命令的参数类型。

服务器上装了 **「时装工坊」Armourer's Workshop `3.4.0-beta.3`**（`[时装工坊] armourersworkshop-forge-1.20.1-3.4.0-beta.3.jar`），它注册了一个自定义参数类型 `FileArgumentType`（用于自己命令的文件路径补全）。**reload 之后它的文件列表缓存 `lists` 变成 null 且没重建**，于是序列化时炸了：

```
java.lang.NullPointerException: Cannot invoke "java.util.ArrayList.size()" because "lists" is null
  at moe.plushie.armourers_workshop.init.command.FileArgumentType$1.serializeToNetwork(FileArgumentType.java:47)
  ...
  at net.minecraft.network.protocol.game.ClientboundCommandsPacket.m_5779_(...)   ← 编码命令树包
```
→ netty `EncoderException` → 发包失败 → 该玩家断线。

**每次 reload 都会把当时在线的人全部踢掉**（日志里 4 次 reload、4 次全踢，100% 复现）。跟 cs2d 数据包没有任何关系（日志里 `cs2d` 只出现两次，都是正常执行 `cs2d:map/book`）。

所以：

1. **最好的办法**：把这个模组升到 3.4.0 正式版或更新；服务器上没人用时装工坊就直接删。之后 `/reload` 就能正常用了。
2. 不处理的话，就**改完包重启服务端**（全新启动时 `lists` 会正常初始化，不会 NPE）。
3. 想热更新又不想踢人：目前没有干净的路子——reload 必然重发命令树，一定会撞上这个 NPE。
