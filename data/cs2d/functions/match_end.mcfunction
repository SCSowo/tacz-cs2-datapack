# 比赛结束
scoreboard players set #state cs2d.g 4
scoreboard players set #timer cs2d.g 10
execute if score T cs2d.wins > CT cs2d.wins run title @a title {"text":"恐怖分子 赢得比赛","color":"gold","bold":true}
execute if score CT cs2d.wins > T cs2d.wins run title @a title {"text":"反恐精英 赢得比赛","color":"blue","bold":true}
execute if score T cs2d.wins = CT cs2d.wins run title @a title {"text":"平局","color":"yellow","bold":true}
title @a subtitle [{"text":"最终 ","color":"gray"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"gold"},{"text":" : ","color":"gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"blue"},{"text":"   10 秒后重开","color":"gray"}]
tellraw @a [{"text":"===== 比赛结束 ","color":"yellow"},{"text":"T ","color":"gold"},{"score":{"name":"T","objective":"cs2d.wins"},"color":"gold"},{"text":" : ","color":"gray"},{"score":{"name":"CT","objective":"cs2d.wins"},"color":"blue"},{"text":" CT","color":"blue"},{"text":" =====","color":"yellow"}]
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2 1
