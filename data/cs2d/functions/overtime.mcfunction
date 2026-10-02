# 加时赛：12:12 时进入，先到「进入加时时的分数 +4」分（通常 16），双方 $10000
scoreboard players set #ot cs2d.g 1
# 目标分 = 进入加时时的分数 + 4（12:12 → 先到 16），不再写死 16
scoreboard players operation #target cs2d.g = T cs2d.wins
scoreboard players add #target cs2d.g 4
# 记录加时起点，之后每 #oth 回合换边（#ot 已置 1，下面换边会顺带把经济重置成 $10000）
scoreboard players operation #otbase cs2d.g = #round cs2d.g
function cs2d:swap_sides
scoreboard players set @a cs2d.money 10000
scoreboard players set #lossT cs2d.g 0
scoreboard players set #lossCT cs2d.g 0
title @a title {"text":"加时赛！","color":"yellow","bold":true}
title @a subtitle [{"text":"先到 ","color":"gold"},{"score":{"name":"#target","objective":"cs2d.g"},"color":"yellow","bold":true},{"text":" 分 — 双方 $10000","color":"gold"}]
tellraw @a [{"text":"===== 加时赛：先到 ","color":"gold"},{"score":{"name":"#target","objective":"cs2d.g"},"color":"yellow","bold":true},{"text":" 分获胜，双方起始资金 $10000 =====","color":"gold"}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2 1
