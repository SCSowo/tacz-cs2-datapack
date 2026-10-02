# 发放 Galil AR（-$1800）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 3
scoreboard players set @s cs2d.w1p 1800
function cs2d:gun/galil
scoreboard players remove @s cs2d.money 1800
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 15
scoreboard players set @s cs2d.lbp 1800
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
