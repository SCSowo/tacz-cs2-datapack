# 保险：未设置过的计分板用 matches 0 判不出来，这里全部补 0
execute unless score @s cs2d.w1 matches 0.. run scoreboard players set @s cs2d.w1 0
scoreboard players set @s cs2d.w1p 0
execute unless score @s cs2d.w2 matches 0.. run scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 0
execute unless score @s cs2d.nf matches 0.. run scoreboard players set @s cs2d.nf 0
execute unless score @s cs2d.nh matches 0.. run scoreboard players set @s cs2d.nh 0
execute unless score @s cs2d.ns matches 0.. run scoreboard players set @s cs2d.ns 0
execute unless score @s cs2d.nm matches 0.. run scoreboard players set @s cs2d.nm 0
execute unless score @s cs2d.arm matches 0.. run scoreboard players set @s cs2d.arm 0
execute unless score @s cs2d.kit matches 0.. run scoreboard players set @s cs2d.kit 0
execute unless score @s cs2d.lb matches 0.. run scoreboard players set @s cs2d.lb 0
execute unless score @s cs2d.lbp matches 0.. run scoreboard players set @s cs2d.lbp 0
execute unless score @s cs2d.kills matches 0.. run scoreboard players set @s cs2d.kills 0
scoreboard players set @s cs2d.plt 0
tag @s remove cs2d.planting
# 回合重置（@s = 玩家）：装备由 kit/apply 按计分板重发，备弹随之刷新
gamemode adventure @s
tag @s remove cs2d.dead
tag @s remove cs2d.defusing
effect clear @s
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:saturation 1000000 0 true
scoreboard players set @s cs2d.def 0
function cs2d:kit/apply
