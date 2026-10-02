# 用 #r1x/#r1y/#r1z（角①）和 #r2x/#r2y/#r2z（角②）填充 #rx1..#rz2
# 水平方向 = 两点围成的矩形，长宽可不同；垂直自动扩成 脚下1格 ~ 头顶3格
scoreboard players operation #rx1 cs2d.g = #r1x cs2d.g
scoreboard players operation #rx2 cs2d.g = #r2x cs2d.g
scoreboard players operation #ry1 cs2d.g = #r1y cs2d.g
scoreboard players operation #ry2 cs2d.g = #r2y cs2d.g
scoreboard players operation #rz1 cs2d.g = #r1z cs2d.g
scoreboard players operation #rz2 cs2d.g = #r2z cs2d.g
# 规范化：保证 1 <= 2（玩家可能先点右下再点左上）
function cs2d:map/rect_norm
# 垂直扩展
scoreboard players operation #ry1 cs2d.g -= #one cs2d.g
scoreboard players operation #ry2 cs2d.g += #three cs2d.g
