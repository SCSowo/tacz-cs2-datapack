# 发放 UMP-45（-$1200）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 16
scoreboard players set @s cs2d.w1p 1200
function cs2d:gun/ump45
scoreboard players remove @s cs2d.money 1200
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 32
scoreboard players set @s cs2d.lbp 1200
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
