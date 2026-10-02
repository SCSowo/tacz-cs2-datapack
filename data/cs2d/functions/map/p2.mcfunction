# 记录对角法「角②」并生成矩形（站对角位置上执行）
execute unless score #hasp1 cs2d.g matches 1 run tellraw @a {"text":"[CS2] 请先站到第一个角点，点「记录角①」","color":"red"}
execute if score #hasp1 cs2d.g matches 1 run function cs2d:map/p2_go
