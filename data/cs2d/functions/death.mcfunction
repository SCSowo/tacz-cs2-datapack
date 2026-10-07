# 玩家死亡（@s = 死者）：CS2 规则 —— 死亡后装备丢失，下回合需重买
tag @s add cs2d.dead
tag @s remove cs2d.planting
scoreboard players set @s cs2d.plt 0
effect clear @s
gamemode spectator @s
# 掉落武器（死亡原地）：主武器优先、没有则手枪 + 一个投掷物
function cs2d:wdrop/gun
function cs2d:wdrop/nade
# 带着 C4 死掉：掉落物销毁 + 放一个只有匪能捡的标记
execute if score @s cs2d.c4 matches 1.. run function cs2d:c4_drop
# 清空背包（keepInventory=true，物品不会自动掉，这里手动清）
clear @s
# 拉回本阵营出生点并刷新重生点
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
