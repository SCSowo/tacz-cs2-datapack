# 每 tick：CT 且回合进行中且炸弹已安放 → 判断是否开始蹲下拆除（@s = 玩家）
# 本 tick 是否蹲着 → #snk 1/0（NBT 主判据 + sneak_time 备判据）
scoreboard players set #snk cs2d.tmp 0
execute if entity @s[nbt={Sneaking:1b}] run scoreboard players set #snk cs2d.tmp 1
execute if score @s cs2d.snk > @s cs2d.snk0 run scoreboard players set #snk cs2d.tmp 1
# 是否靠近炸弹（3 格内）—— 不能用 nbt=Inventory 那套，marker 实体距离最稳
scoreboard players set #can cs2d.tmp 0
execute at @s if entity @e[type=marker,tag=cs2d.bomb,distance=..3,limit=1] run scoreboard players set #can cs2d.tmp 1
# 蹲下 + 靠近 → 开始拆除（没钳也能拆，只是 10 秒）
execute if score #can cs2d.tmp matches 1 if score #snk cs2d.tmp matches 1 unless entity @s[tag=cs2d.defusing] run function cs2d:defuse_go
