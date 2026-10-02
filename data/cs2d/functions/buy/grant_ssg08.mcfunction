# 发放 SSG 08（-$1700）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 11
scoreboard players set @s cs2d.w1p 1700
function cs2d:gun/ssg08
scoreboard players remove @s cs2d.money 1700
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 27
scoreboard players set @s cs2d.lbp 1700
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
