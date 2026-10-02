# ===== 快捷栏槽位强制（每秒执行，@s = 玩家）=====
# 1=主武器 2=手枪 3=刀 4=闪光 5=高爆 6=烟雾 7=燃烧瓶 8=C4
# 9 号位 / 副手 / 背包 27 格一律不许放，扫到就清掉。
# 每件发放的物品都带 cs2d_s:Xb 标签（X = 它该在的那一格），
# 不在本格就搬回去；目标格已经有东西 = 替换掉（CS2 捡枪就是这个语义，不会叠加）。

# ① 归位：把带标签的物品搬回它自己的格子
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.0 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:0b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.1 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:1b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.2 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:2b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.3 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:3b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.4 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:4b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.5 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:5b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.7
execute if data entity @s Inventory[{Slot:7b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.7 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.6 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:6b}}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.0
execute if data entity @s Inventory[{Slot:0b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.0 with minecraft:air
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.1
execute if data entity @s Inventory[{Slot:1b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.1 with minecraft:air
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.2
execute if data entity @s Inventory[{Slot:2b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.2 with minecraft:air
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.3
execute if data entity @s Inventory[{Slot:3b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.3 with minecraft:air
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.4
execute if data entity @s Inventory[{Slot:4b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.4 with minecraft:air
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.5
execute if data entity @s Inventory[{Slot:5b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.5 with minecraft:air
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.6
execute if data entity @s Inventory[{Slot:6b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.6 with minecraft:air
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.7 from entity @s hotbar.8
execute if data entity @s Inventory[{Slot:8b,tag:{cs2d_s:7b}}] run item replace entity @s hotbar.8 with minecraft:air

# ② 清空禁用位置：第 9 格 / 副手 / 整个背包（27 格）
execute if data entity @s Inventory[{Slot:8b}] run item replace entity @s hotbar.8 with minecraft:air
execute if data entity @s Inventory[{Slot:-106b}] run item replace entity @s weapon.offhand with minecraft:air
execute if data entity @s Inventory[{Slot:9b}] run item replace entity @s inventory.0 with minecraft:air
execute if data entity @s Inventory[{Slot:10b}] run item replace entity @s inventory.1 with minecraft:air
execute if data entity @s Inventory[{Slot:11b}] run item replace entity @s inventory.2 with minecraft:air
execute if data entity @s Inventory[{Slot:12b}] run item replace entity @s inventory.3 with minecraft:air
execute if data entity @s Inventory[{Slot:13b}] run item replace entity @s inventory.4 with minecraft:air
execute if data entity @s Inventory[{Slot:14b}] run item replace entity @s inventory.5 with minecraft:air
execute if data entity @s Inventory[{Slot:15b}] run item replace entity @s inventory.6 with minecraft:air
execute if data entity @s Inventory[{Slot:16b}] run item replace entity @s inventory.7 with minecraft:air
execute if data entity @s Inventory[{Slot:17b}] run item replace entity @s inventory.8 with minecraft:air
execute if data entity @s Inventory[{Slot:18b}] run item replace entity @s inventory.9 with minecraft:air
execute if data entity @s Inventory[{Slot:19b}] run item replace entity @s inventory.10 with minecraft:air
execute if data entity @s Inventory[{Slot:20b}] run item replace entity @s inventory.11 with minecraft:air
execute if data entity @s Inventory[{Slot:21b}] run item replace entity @s inventory.12 with minecraft:air
execute if data entity @s Inventory[{Slot:22b}] run item replace entity @s inventory.13 with minecraft:air
execute if data entity @s Inventory[{Slot:23b}] run item replace entity @s inventory.14 with minecraft:air
execute if data entity @s Inventory[{Slot:24b}] run item replace entity @s inventory.15 with minecraft:air
execute if data entity @s Inventory[{Slot:25b}] run item replace entity @s inventory.16 with minecraft:air
execute if data entity @s Inventory[{Slot:26b}] run item replace entity @s inventory.17 with minecraft:air
execute if data entity @s Inventory[{Slot:27b}] run item replace entity @s inventory.18 with minecraft:air
execute if data entity @s Inventory[{Slot:28b}] run item replace entity @s inventory.19 with minecraft:air
execute if data entity @s Inventory[{Slot:29b}] run item replace entity @s inventory.20 with minecraft:air
execute if data entity @s Inventory[{Slot:30b}] run item replace entity @s inventory.21 with minecraft:air
execute if data entity @s Inventory[{Slot:31b}] run item replace entity @s inventory.22 with minecraft:air
execute if data entity @s Inventory[{Slot:32b}] run item replace entity @s inventory.23 with minecraft:air
execute if data entity @s Inventory[{Slot:33b}] run item replace entity @s inventory.24 with minecraft:air
execute if data entity @s Inventory[{Slot:34b}] run item replace entity @s inventory.25 with minecraft:air
execute if data entity @s Inventory[{Slot:35b}] run item replace entity @s inventory.26 with minecraft:air

# ③ C4 只有 T 能拿（CT 从地上捡到也立刻没收）
execute if entity @s[team=!T] run clear @s minecraft:redstone_block{cs2d_c4:1b}

# ④ 道具用掉了就把记录清掉，下回合不会白送回来
execute unless data entity @s Inventory[{Slot:3b}] run scoreboard players set @s cs2d.nf 0
execute unless data entity @s Inventory[{Slot:4b}] run scoreboard players set @s cs2d.nh 0
execute unless data entity @s Inventory[{Slot:5b}] run scoreboard players set @s cs2d.ns 0
execute unless data entity @s Inventory[{Slot:6b}] run scoreboard players set @s cs2d.nm 0

# ⑤ 武器记录跟着手里的枪走：捡了别人的枪下回合就留着，掉了/没枪就清零（下回合得重买）
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:ak47"}}] run scoreboard players set @s cs2d.w1 4
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:awp"}}] run scoreboard players set @s cs2d.w1 6
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:galilar"}}] run scoreboard players set @s cs2d.w1 3
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:m4a1"}}] run scoreboard players set @s cs2d.w1 5
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:mac10"}}] run scoreboard players set @s cs2d.w1 1
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:mag7"}}] run scoreboard players set @s cs2d.w1 7
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"cs2_wt:mp9"}}] run scoreboard players set @s cs2d.w1 2
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:sg553"}}] run scoreboard players set @s cs2d.w1 8
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:aug"}}] run scoreboard players set @s cs2d.w1 9
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:famas"}}] run scoreboard players set @s cs2d.w1 10
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"daffas_arsenal:ssg69"}}] run scoreboard players set @s cs2d.w1 11
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lrl:scar_l_ocean"}}] run scoreboard players set @s cs2d.w1 12
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:sa58"}}] run scoreboard players set @s cs2d.w1 13
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lrl:m4a1_zero"}}] run scoreboard players set @s cs2d.w1 14
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lrl:hk_mp5a5_agent"}}] run scoreboard players set @s cs2d.w1 15
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lrl:ump45_crimson_foil"}}] run scoreboard players set @s cs2d.w1 16
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:p90"}}] run scoreboard players set @s cs2d.w1 17
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:pp19"}}] run scoreboard players set @s cs2d.w1 18
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"daffas_arsenal:spasi15"}}] run scoreboard players set @s cs2d.w1 19
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"daffas_arsenal:sgputer"}}] run scoreboard players set @s cs2d.w1 20
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lrl:db_long_super"}}] run scoreboard players set @s cs2d.w1 21
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:mg42"}}] run scoreboard players set @s cs2d.w1 22
execute if data entity @s Inventory[{Slot:0b,tag:{GunId:"lradd:ultimax100"}}] run scoreboard players set @s cs2d.w1 23
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"lradd:p250"}}] run scoreboard players set @s cs2d.w2 3
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"lrl:p320_doctor"}}] run scoreboard players set @s cs2d.w2 4
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"daffas_arsenal:taurus"}}] run scoreboard players set @s cs2d.w2 5
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"daffas_arsenal:p99_hak"}}] run scoreboard players set @s cs2d.w2 6
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"daffas_arsenal:taurus2"}}] run scoreboard players set @s cs2d.w2 7
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"lradd:malorian"}}] run scoreboard players set @s cs2d.w2 8
execute unless data entity @s Inventory[{Slot:0b}] run scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
execute if data entity @s Inventory[{Slot:1b,tag:{GunId:"cs2_wt:deagle"}}] run scoreboard players set @s cs2d.w2 2
execute if score @s cs2d.w2 matches 2 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"cs2_wt:deagle"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute if score @s cs2d.w2 matches 3 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"lradd:p250"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute if score @s cs2d.w2 matches 4 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"lrl:p320_doctor"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute if score @s cs2d.w2 matches 5 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"daffas_arsenal:taurus"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute if score @s cs2d.w2 matches 6 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"daffas_arsenal:p99_hak"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute if score @s cs2d.w2 matches 7 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"daffas_arsenal:taurus2"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute if score @s cs2d.w2 matches 8 unless data entity @s Inventory[{Slot:1b,tag:{GunId:"lradd:malorian"}}] run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0


# ⑥ 类型检查：每一格只允许放它该放的东西（书除外，选队书/管理书要留着翻）
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:0b}] unless data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] unless data entity @s Inventory[{Slot:0b,id:"minecraft:written_book"}] run item replace entity @s hotbar.0 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:1b}] unless data entity @s Inventory[{Slot:1b,id:"tacz:modern_kinetic_gun"}] unless data entity @s Inventory[{Slot:1b,id:"minecraft:written_book"}] run item replace entity @s hotbar.1 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:2b}] unless data entity @s Inventory[{Slot:2b,id:"lrtactical:melee"}] unless data entity @s Inventory[{Slot:2b,id:"minecraft:written_book"}] run item replace entity @s hotbar.2 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:3b}] unless data entity @s Inventory[{Slot:3b,id:"lrtactical:throwable"}] unless data entity @s Inventory[{Slot:3b,id:"minecraft:written_book"}] run item replace entity @s hotbar.3 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:4b}] unless data entity @s Inventory[{Slot:4b,id:"lrtactical:throwable"}] unless data entity @s Inventory[{Slot:4b,id:"minecraft:written_book"}] run item replace entity @s hotbar.4 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:5b}] unless data entity @s Inventory[{Slot:5b,id:"lrtactical:throwable"}] unless data entity @s Inventory[{Slot:5b,id:"minecraft:written_book"}] run item replace entity @s hotbar.5 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:6b}] unless data entity @s Inventory[{Slot:6b,id:"lrtactical:throwable"}] unless data entity @s Inventory[{Slot:6b,id:"minecraft:written_book"}] run item replace entity @s hotbar.6 with minecraft:air
execute if score #invstrict cs2d.g matches 1 if data entity @s Inventory[{Slot:7b}] unless data entity @s Inventory[{Slot:7b,id:"minecraft:redstone_block"}] unless data entity @s Inventory[{Slot:7b,id:"minecraft:written_book"}] run item replace entity @s hotbar.7 with minecraft:air
