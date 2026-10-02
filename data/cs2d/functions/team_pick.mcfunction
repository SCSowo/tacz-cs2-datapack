# 选队 trigger：1=T 2=CT 3=随机 4=退出 5=重发选队书
execute if score @s cs2d.team matches 1 run function cs2d:team/join_t
execute if score @s cs2d.team matches 2 run function cs2d:team/join_ct
execute if score @s cs2d.team matches 3 run function cs2d:team/join_auto
execute if score @s cs2d.team matches 4 run function cs2d:team/leave
execute if score @s cs2d.team matches 5 run function cs2d:team/book
scoreboard players enable @s cs2d.team
