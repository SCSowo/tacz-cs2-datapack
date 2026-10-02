# 换边时把比分挪到新的阵营栏
# cs2d.wins 记在阵营名 T / CT 上，但 CS2 的记分板记的是「人」的累计分：
# 换边后这批人换了阵营，他们上半场拿的分要跟着走到新阵营栏，
# 否则自己打出来的分会显示在对手那一侧（看着像"分数被换到对面去了"）。
scoreboard players operation #sws cs2d.g = T cs2d.wins
scoreboard players operation T cs2d.wins = CT cs2d.wins
scoreboard players operation CT cs2d.wins = #sws cs2d.g
