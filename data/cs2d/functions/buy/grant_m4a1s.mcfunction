# 发放 M4A1-S（-$2900）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 14
scoreboard players set @s cs2d.w1p 2900
function cs2d:gun/m4a1s
scoreboard players remove @s cs2d.money 2900
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 30
scoreboard players set @s cs2d.lbp 2900
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
