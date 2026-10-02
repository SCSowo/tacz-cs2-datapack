# 玩家死亡（@s = 死者）：CS2 规则 —— 死亡后装备全部丢失，下回合需重买
tag @s add cs2d.dead
tag @s remove cs2d.planting
scoreboard players set @s cs2d.plt 0
effect clear @s
gamemode spectator @s
# 瞬时重生会把人丢到世界出生点，这里立刻拉回本阵营出生点并刷新重生点
function cs2d:spawn_home
scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
scoreboard players set @s cs2d.nf 0
scoreboard players set @s cs2d.nh 0
scoreboard players set @s cs2d.ns 0
scoreboard players set @s cs2d.nm 0
scoreboard players set @s cs2d.arm 0
scoreboard players set @s cs2d.kit 0
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000001
attribute @s minecraft:generic.armor modifier remove aaaaaaaa-0000-0000-0000-000000000002
playsound minecraft:entity.player.death master @a ~ ~ ~ 2 1
# 带着 C4 死掉：掉落物销毁 + 放一个只有匪能捡的标记
execute if score @s cs2d.c4 matches 1.. run function cs2d:c4_drop
# 累计死亡 +1 并刷新玩家列表 K/D
scoreboard players add @s cs2d.td 1
function cs2d:kd
