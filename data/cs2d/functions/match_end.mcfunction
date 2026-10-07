# 比赛结束
scoreboard players set #state cs2d.g 4
scoreboard players set #timer cs2d.g 10
execute if score T cs2d.wins > CT cs2d.wins run title @a title {"text":"恐怖分子 以最多的胜利赢得了比赛","color":"gold","bold":true}
execute if score CT cs2d.wins > T cs2d.wins run title @a title {"text":"反恐精英 以最多的胜利赢得了比赛","color":"blue","bold":true}
execute if score T cs2d.wins = CT cs2d.wins run title @a title {"text":"平局","color":"yellow","bold":true}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2 1
