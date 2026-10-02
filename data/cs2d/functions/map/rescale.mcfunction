# 按 #dir 调整所有已设置的区域（1=外扩 2=内缩）
execute if score #zT cs2d.g matches 1 run function cs2d:map/rescale_t
execute if score #zC cs2d.g matches 1 run function cs2d:map/rescale_c
execute if score #zA cs2d.g matches 1 run function cs2d:map/rescale_a
execute if score #zB cs2d.g matches 1 run function cs2d:map/rescale_b
execute if score #dir cs2d.g matches 1 run tellraw @a {"text":"[CS2] 所有区域外扩 1 格","color":"green"}
execute if score #dir cs2d.g matches 2 run tellraw @a {"text":"[CS2] 所有区域内缩 1 格","color":"green"}
