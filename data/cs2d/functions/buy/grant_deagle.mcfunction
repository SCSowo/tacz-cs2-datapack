# 发放 Desert Eagle（-$700）
# 手上已有别的手枪 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w2p matches 1.. run function cs2d:buy/sell_w2
scoreboard players set @s cs2d.w2 2
scoreboard players set @s cs2d.w2p 700
function cs2d:gun/deagle
scoreboard players remove @s cs2d.money 700
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 12
scoreboard players set @s cs2d.lbp 700
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
