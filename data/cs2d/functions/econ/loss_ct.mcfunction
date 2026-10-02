# CT 失败：按连败次数发补偿
execute if score #lossCT cs2d.g matches 1 run scoreboard players add @a[team=CT] cs2d.money 1400
execute if score #lossCT cs2d.g matches 2 run scoreboard players add @a[team=CT] cs2d.money 1900
execute if score #lossCT cs2d.g matches 3 run scoreboard players add @a[team=CT] cs2d.money 2400
execute if score #lossCT cs2d.g matches 4 run scoreboard players add @a[team=CT] cs2d.money 2900
execute if score #lossCT cs2d.g matches 5.. run scoreboard players add @a[team=CT] cs2d.money 3400
