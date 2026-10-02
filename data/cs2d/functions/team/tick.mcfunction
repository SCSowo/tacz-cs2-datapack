# 每 tick：统计各阵营人数（选队书里动态显示）+ 给没书的人补一本
execute store result score #t cs2d.tmp if entity @a[team=T]
execute store result score #c cs2d.tmp if entity @a[team=CT]
execute store result score #n cs2d.tmp if entity @a[team=]
execute as @a[team=] unless data entity @s Inventory[{id:"minecraft:written_book",tag:{cs2d_teambook:1b}}] run function cs2d:team/book
