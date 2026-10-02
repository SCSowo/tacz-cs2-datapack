# 清掉全部高光实体（玻璃 + 悬浮标签）
# 这些 display 实体会被写进区块存档；1.20.1 读取时把 text 当字符串读、实际存的是
# 复合标签，会报 "Display entityNot a string"。所以重绘 / 换地图前先清干净，
# 保证存档里不留旧实体。
kill @e[type=block_display,tag=cs2d.fx]
kill @e[type=text_display,tag=cs2d.fx]
