# 发放 AUG（-$3300）
# 手上已有别的主武器 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w1p matches 1.. run function cs2d:buy/sell_w1
scoreboard players set @s cs2d.w1 9
scoreboard players set @s cs2d.w1p 3300
function cs2d:gun/aug
scoreboard players remove @s cs2d.money 3300
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 25
scoreboard players set @s cs2d.lbp 3300
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
