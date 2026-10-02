# 发放 MAG-7（-$1300）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 7
scoreboard players set @s cs2d.w1p 1300
function cs2d:gun/mag7
scoreboard players remove @s cs2d.money 1300
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 19
scoreboard players set @s cs2d.lbp 1300
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
