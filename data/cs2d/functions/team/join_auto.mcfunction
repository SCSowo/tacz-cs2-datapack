# 随机分配到人少的一方（@s = 玩家）
execute store result score #t cs2d.tmp if entity @a[team=T]
execute store result score #c cs2d.tmp if entity @a[team=CT]
execute if score #t cs2d.tmp > #c cs2d.tmp run function cs2d:team/join_ct
execute unless score #t cs2d.tmp > #c cs2d.tmp run function cs2d:team/join_t
