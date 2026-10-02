# tacz-cs2-datapack

**警告：作者懒癌犯了，以下ai coding的readme暂时作为占位符，后续该readme和代码将会进行大批review。**

该数据包为在 **Minecraft Java 1.20.1（Forge + TaCZ）** 里复刻 **CS2 竞技模式**的开源数据包。


回合状态机、CS2 官方经济、MR12 赛制与加时、聊天栏购买菜单、C4 安放/拆除、HUD 与队友 X 光——
全部用原版数据包（`.mcfunction`）实现，**不依赖任何服务端插件**。


[English quick start ↓](#english-quick-start)

---

## 目录

- [功能](#功能)
- [环境要求](#环境要求)
- [安装](#安装)
- [5 分钟跑起来](#5-分钟跑起来)
- [操作与命令](#操作与命令)
- [调参](#调参)
- [仓库结构](#仓库结构)
- [已知限制](#已知限制)
- [第三方资源声明](#第三方资源声明)
- [许可证](#许可证)

---

## 功能

| 模块 | 内容 |
|---|---|
| **赛制** | MR12：12 回合换边、先到 **13 分**获胜；12:12 进加时（MR3，每 3 回合换边，先到 16 分，双方 $10000） |
| **回合** | 冻结 15s → 对局 115s → 结算 5s，`#state` = 0 等待 / 1 冻结 / 2 对局 / 3 结算 / 4 比赛结束 / 5 强制停止 |
| **经济** | 起始 **$800**、上限 **$16000**、胜利 **+$3250**、连败阶梯 $1400→$1900→$2400→$2900→$3400、安放 +$300、拆除 +$300、T 输但下过包 +$800 |
| **购买** | 聊天栏按钮菜单（按阵营分版，买不了的枪不出现）；冻结 15s + 开局后 20s 内可买；**退款**最近一次全额返还；已持有同款拒绝；换枪自动折回原价 |
| **军械库** | **32 把 CS2 枪械**（价格全部对齐 CS2 官方值）+ 凯夫拉/头盔 + 4 种投掷物 + 拆弹钳 |
| **炸弹** | 随机 T 持 C4；包点内**按住潜行 3.25 秒**安放；CT 在 3 格内按住潜行拆除（有钳 **5s** / 无钳 **10s**）；40s 爆炸，12 格必死、12~20 格重伤 |
| **HUD** | 顶栏 bossbar `T □□□ 3   1:42   5 □□□□ CT`（□=存活人数）；actionbar 只留 `$金钱`；安放/拆除独立进度条 |
| **队伍** | 进服发「CS2 选边」书自选 T（橙）/ CT（蓝）；敌方名字牌不可见；队友发光轮廓 X 光（可关） |
| **战绩** | Tab 玩家列表显示**本场伤害**（默认）/ K-D / K/D 三种模式，可循环切换 |
| **地图** | 出生区与 A/B 包点均为**可调矩形**（对角两点或中心+半径）+ 常驻高光；**8 个地图槽位**保存/加载/命名 |
| **表现** | killfeed（含凶器名）、每回合 MVP、回合横幅区分四种结束原因、C4 滴答随剩余时间加速 |
| **防作弊约束** | 快捷栏槽位强制归位（1 主武器 / 2 手枪 / 3 刀 / 4~7 投掷物 / 8 C4）、局外没收武器并锁冒险模式、C4 只有 T 能捡 |

---

## 环境要求

- **Minecraft Java Edition 1.20.1**
- **Forge**（1.20.1）
- **[TaCZ 永恒枪械工坊：零](https://www.curseforge.com/minecraft/mc-mods/tacz)** 1.1.8 —— 提供 `tacz:modern_kinetic_gun` 物品
- **绿葡萄战术装备（lrtactical）** —— 提供近战 `lrtactical:melee` 与投掷物 `lrtactical:throwable`
- **TaCZ 枪包 4 套**（放进服务端 `tacz/` 目录）：

  | 枪包命名空间 | 提供的枪 | 说明 |
  |---|---|---|
  | `cs2_wt` | 10 把 | CS2 Pack 枪与刀 / CS2 Knifes Pack（AK、AWP、Deagle、Galil、Glock、M4A4、MAC-10、MAG-7、MP9、USP-S） |
  | `lradd` | 10 把 | `lradd_default_gun`（SG553、G3SG1、FAMAS、AUG、P90、PP-野牛、M249、Negev、P250、R8） |
  | `lrl` | 6 把 | 同上的皮肤版（M4A1-S、SCAR-20、MP5-SD、UMP-45、Five-SeveN、截短霰弹枪） |
  | `daffas_arsenal` | 6 把 | SSG 08、Nova、XM1014、Tec-9、CZ75-Auto、双持贝瑞塔 |

> ⚠️ **本仓库不包含以上任何模组与枪包**，请自行从各自作者处获取，见 [第三方资源声明](#第三方资源声明)。
> 枪械的伤害、爆头倍率、护甲穿透、后坐力全部**由枪包决定**，数据包不覆盖。

---

## 安装

```bash
cd <服务端目录>/world/datapacks
git clone https://github.com/SCSowo/tacz-cs2-datapack.git
```

没有 git 就把整个文件夹复制进 `world/datapacks/`。落点必须是这样：

```
world/datapacks/tacz-cs2-datapack/pack.mcmeta     ← 第一眼就能看到 pack.mcmeta 和 data
world/datapacks/tacz-cs2-datapack/data/
```

然后：

```
/datapack list                              # 确认 file/tacz-cs2-datapack 在 Enabled 段
/datapack enable "file/tacz-cs2-datapack"   # 若只在 Available 段
/function cs2d:diag                         # 能刷出状态就说明包活了
```

> **改完包不要用 `/reload` 热更新**。若服务端装了「时装工坊」（Armourer's Workshop 3.4.0-beta.3），
> 它有个已知 NPE bug，`/reload` 会把当时在线的人**全部踢掉**。改完包请**重启服务端**。
> 详见 [`docs/DEMO说明.md`](docs/DEMO说明.md) 的排查章节。

---

## 5 分钟跑起来

1. **标记地图**：OP 执行 `/function cs2d:book` 拿管理书，站到位置上标 T/CT 出生区和 A/B 包点。
   没有现成地图？`/function cs2d:map/build_demo` 会在 y=100 生成一个 31×31 浮空演示平台并自动标好。

2. **选阵营**：每人进服自动拿到一本「CS2 选边」书，点击选 **T（橙）** 或 **CT（蓝）**。
   书丢了自动补发，也能用 `/function cs2d:team` 重发。

3. **开始比赛**：管理员在管理书**第 ⑥ 页点 [ 开始比赛 ]**（或 `/function cs2d:start`）。
   没选阵营的人会自动补进人少的一方；只有一方有人会随机调 1 人过去。

4. **打**：冻结期从聊天栏菜单买枪 → 对局 → 结算。比赛结束会停住等再次点开始，**不会自动重开**。

```
/function cs2d:stop     # 立即中止比赛，且不再自动开始
/function cs2d:start    # 解除中止并重开一场
```

---

## 操作与命令

| 动作 | 操作 |
|---|---|
| 安放 C4 | 站在包点内**按住潜行（Shift）3.25 秒**；移动或松开即中断 |
| 拆除 C4 | 走到炸弹 3 格内**按住潜行**：有钳 5 秒 / 无钳 10 秒 |
| 安放/拆除自检 | `/trigger cs2d.plant set 1`、`/trigger cs2d.defl set 1` —— 只报「卡在哪一条」 |
| 购买 | 聊天栏菜单按钮（回合开始时自动推送）；翻不到就点「重看本菜单」 |
| 退款 | 菜单最后一行，或 `/trigger cs2d.buy set 99` |

**命令速查**

```
/function cs2d:book          # 地图管理书（标区域 / 存读地图 / 第⑥页开局）
/function cs2d:team          # 选队书
/function cs2d:buy_menu      # 购买菜单（手动重发）
/function cs2d:start         # 开始比赛
/function cs2d:stop          # 强制停止
/function cs2d:diag          # 自检
/function cs2d:map/load      # 加载当前槽位地图
```

**快捷栏槽位（强制归位，每 0.2 秒扫一次）**

| 格 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|---|
| 内容 | 主武器 | 手枪 | 刀 | 闪光弹 | 高爆 | 烟雾 | 燃烧瓶 | **C4** | （空） |

第 9 格、副手、背包 27 格禁止放任何东西（选队书/管理书除外）；拆弹钳走记分板不占物品栏。

---

## 调参

所有常量都是 `cs2d.g` 上的计分板，**游戏内随时可改，当场生效**：

| 想改什么 | 命令 | 默认 |
|---|---|---|
| 胜利回合数 | `/scoreboard players set #target cs2d.g 13` | 13 |
| 半场回合数 | `/scoreboard players set #halfr cs2d.g 12` | 12 |
| 最少开局人数 | `/scoreboard players set #minp cs2d.g 2` | 2 |
| 开局后可购买秒数 | `/scoreboard players set #buywin cs2d.g 20` | 20 |
| 安放耗时（tick） | `/scoreboard players set #plantt cs2d.g 65` | 65（3.25s） |
| 拆除耗时（有钳/无钳） | `/scoreboard players set #deftk cs2d.g 100` / `#deftn cs2d.g 200` | 100 / 200 |
| 正方形标法半径 | `/scoreboard players set #rad cs2d.g 3` | 3 |
| 地图槽位 | `/scoreboard players set #slot cs2d.g 1` | 1 |
| 队友 X 光开关 | `/trigger cs2d.ctrl set 97` | 开 |
| Tab 列表模式 | `/trigger cs2d.ctrl set 96` | 3（本场伤害） |
| 库存扫描间隔（tick） | `/scoreboard players set #invhz cs2d.g 4` | 4 |
| 伤害换算除数 | `/scoreboard players set #dmgdiv cs2d.g 2` | 2 |

> ⚠️ `#halfr` / `#target` 会在**每次开服和每场新比赛**被强制写回 12 / 13。
> 想**永久**改赛制，得同时改 `data/cs2d/functions/load.mcfunction` 和 `match_start.mcfunction`。

---

## 仓库结构

```
tacz-cs2-datapack/
├── pack.mcmeta                 ← 数据包本体就在仓库根
├── data/
│   ├── cs2d/                   ← 全部逻辑（命名空间 cs2d）
│   │   ├── functions/          load / tick / round_* / buy/ / gun/ / nade/
│   │   │                       plant_* / defuse_* / map/ / team/ / kit/ / mvp/ …
│   │   ├── loot_tables/        buy_t.json / buy_ct.json（购买菜单排版）
│   │   └── advancements/       kill.json（击杀检测）
│   └── minecraft/tags/functions/   load.json / tick.json
├── docs/
│   ├── README.md               文档索引
│   ├── CS2主流程.md             武器 / 经济 / 回合 / 赛制数值总表
│   └── DEMO说明.md              完整使用说明 + 开发日志 + 故障排查
├── tools/
│   └── validate.py             离线静态校验（改完包先跑这个）
├── LICENSE
└── README.md
```

**改完包务必先跑离线校验**，它能提前抓到所有已知的「函数静默加载失败」陷阱：

```bash
python tools/validate.py
```

检查项：非法转义序列、函数引用悬空、成书 JSON、战利品表 `set_nbt` 转义、
计分板引用、UTF-8 BOM、资源路径大小写、以及**一行里塞了两条命令**（会让整个函数报废）。

全部通过会打印「没有发现问题」。

---

## 已知限制

1. **无法判定爆头**。TaCZ 内部处理爆头伤害，数据包拿不到这个标记，killfeed 不显示 `HS`。
2. **枪械数值由枪包决定**。AWP 备弹/弹匣、M4A4 弹匣等按枪包走，和 CS2 官方值有出入。
3. **不能捡尸体上的枪**（C4 除外，C4 掉落有专门的接管逻辑）。
4. **killfeed 在聊天栏**，不在右上角 —— 数据包改不了死亡消息文案（那在资源包里）。
5. **队友 X 光对敌方也可见**。`glowing` 是实体状态位，原版没有「只对本队渲染轮廓」的接口。
   不想要就用 `/trigger cs2d.ctrl set 97` 关掉。
6. **击杀检测依赖 `player_killed_entity` 进度**，TaCZ 子弹伤害理论上能触发，但**未实测**。
7. 服务器有 **6 人在线以上**时，顶栏存活方块最多显示 5 个。

---

## 第三方资源声明

本仓库**只包含数据包本身的 `.mcfunction` / `.json` 源码**，不包含任何：

- ❌ Minecraft 服务端 / 客户端本体
- ❌ Forge、TaCZ、lrtactical 或任何模组 jar
- ❌ 任何 TaCZ 枪包（`cs2_wt` / `lradd` / `lrl` / `daffas_arsenal` / `tacz_default_gun`）
- ❌ 材质、模型、音效等美术资源

使用本数据包时，上述组件请**各自从其作者处获取**，并遵守各自的许可协议。
本数据包仅通过物品 ID（如 `tacz:modern_kinetic_gun` 与 `GunId`）引用它们，不复制、不再分发。

`Counter-Strike` 及相关名称、数值是 **Valve Corporation** 的商标与知识产权。
本项目是非官方粉丝作品，与 Valve、TaCZ 及其枪包作者**均无隶属关系**。

数据包内的**逻辑代码与文档**则以本仓库的 [MIT 许可证](LICENSE) 授权。

---

## 许可证

[MIT](LICENSE)

---

## English quick start

A **CS2 competitive-mode datapack** for **Minecraft Java 1.20.1 (Forge + TaCZ)** — implemented
entirely with vanilla `.mcfunction` files, no server plugins, namespace `cs2d`.

**Includes:** MR12 with side swap and overtime, CS2 economy (start $800 / cap $16000, loss bonus
ladder), chat-button buy menu with refunds, **32 CS2 weapons** with official prices, C4 plant
(hold sneak 3.25s) and defuse (5s with kit / 10s without), top bossbar HUD showing scores and live
player counts, team selection book, teammate glow, Tab-list damage stats, and an 8-slot map
manager for spawn/bombsite regions.

**Requires (NOT bundled):** Forge 1.20.1 · TaCZ 1.1.8 · lrtactical · four TaCZ gun packs
(`cs2_wt`, `lradd`, `lrl`, `daffas_arsenal`). See [第三方资源声明](#第三方资源声明).

**Install:**

```bash
cd <server>/world/datapacks
git clone https://github.com/SCSowo/tacz-cs2-datapack.git
```

Then in game: `/datapack enable "file/tacz-cs2-datapack"` → `/function cs2d:diag`.

**Play:** `/function cs2d:book` (map admin book) → mark spawns and bombsite A/B →
players pick a side from the "CS2 选边" book → admin clicks **[开始比赛]** on page ⑥
(or `/function cs2d:start`).

**Validate before shipping changes:**

```bash
python tools/validate.py
```

Documentation is in Chinese: [`docs/CS2主流程.md`](docs/CS2主流程.md) (gameplay numbers) and
[`docs/DEMO说明.md`](docs/DEMO说明.md) (full guide + troubleshooting).
