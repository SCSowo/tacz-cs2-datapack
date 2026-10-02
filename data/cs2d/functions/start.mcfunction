# 由管理书「开始比赛」调用：先把没选边的人自动分配，再校验人数，最后开赛
execute unless score #state cs2d.g matches 5 run tellraw @a {"text":"[CS2] 当前不在停止状态，直接开新一场","color":"yellow"}
function cs2d:team/autofill
function cs2d:team/balance
execute store result score #t cs2d.tmp if entity @a[team=T]
execute store result score #c cs2d.tmp if entity @a[team=CT]
execute store result score #n cs2d.tmp if entity @a[team=]
# 自建房允许单边开局（只提醒），但至少要有一个人已经选了阵营
execute unless score #t cs2d.tmp matches 1.. if score #c cs2d.tmp matches 1.. run tellraw @a {"text":"[CS2] 注意：T 方没有人，回合会立刻判 CT 胜","color":"yellow"}
execute unless score #c cs2d.tmp matches 1.. if score #t cs2d.tmp matches 1.. run tellraw @a {"text":"[CS2] 注意：CT 方没有人，回合会立刻判 T 胜","color":"yellow"}
execute unless score #t cs2d.tmp matches 1.. unless score #c cs2d.tmp matches 1.. run tellraw @a {"text":"[CS2] 还没有人选择阵营，无法开始（先发选队书：/function cs2d:team）","color":"red"}
scoreboard players set #go cs2d.g 0
execute if score #t cs2d.tmp matches 1.. run scoreboard players set #go cs2d.g 1
execute if score #c cs2d.tmp matches 1.. run scoreboard players set #go cs2d.g 1
execute if score #go cs2d.g matches 1 run scoreboard players set #state cs2d.g 0
execute if score #go cs2d.g matches 1 run function cs2d:match_start
