# 发放 MP5-SD（-$1500）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 15
scoreboard players set @s cs2d.w1p 1500
function cs2d:gun/mp5sd
scoreboard players remove @s cs2d.money 1500
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 31
scoreboard players set @s cs2d.lbp 1500
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
