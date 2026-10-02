# 一方没人时，从另一方随机调 1 人过去，保证两边都能开
execute store result score #t cs2d.tmp if entity @a[team=T]
execute store result score #c cs2d.tmp if entity @a[team=CT]
execute if score #c cs2d.tmp matches 0 if score #t cs2d.tmp matches 2.. run team join CT @r[team=T]
execute if score #t cs2d.tmp matches 0 if score #c cs2d.tmp matches 2.. run team join T @r[team=CT]
execute if score #c cs2d.tmp matches 0 if score #t cs2d.tmp matches 2.. run tellraw @a {"text":"[CS2] 人数不平衡，已自动调整阵营","color":"yellow"}
execute if score #t cs2d.tmp matches 0 if score #c cs2d.tmp matches 2.. run tellraw @a {"text":"[CS2] 人数不平衡，已自动调整阵营","color":"yellow"}
