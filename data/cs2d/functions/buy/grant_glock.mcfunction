# 发放 Glock-18（-$200）
# 手上已有别的手枪 → 先按原价折回（买新枪自动换掉旧的）
execute if score @s cs2d.w2p matches 1.. run function cs2d:buy/sell_w2
scoreboard players set @s cs2d.w2 0
scoreboard players set @s cs2d.w2p 200
function cs2d:gun/glock
scoreboard players remove @s cs2d.money 200
# 记录本次购买，供退款使用
scoreboard players set @s cs2d.lb 11
scoreboard players set @s cs2d.lbp 200
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 2 1.5
