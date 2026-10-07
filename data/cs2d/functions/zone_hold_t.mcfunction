# 冻结阶段：跑出出生区 → 上缓慢（不再拉回、不再弹提示），冻结结束时解除
function cs2d:zone_in_t
execute if score #zT cs2d.g matches 1 if score #in cs2d.g matches 0 run effect give @s minecraft:slowness 3 6 true
