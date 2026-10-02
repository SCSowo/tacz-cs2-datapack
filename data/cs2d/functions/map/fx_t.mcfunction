# T 出生区 高光：地面发光玻璃 + 悬浮标签
kill @e[type=block_display,tag=cs2d.fxT]
kill @e[type=text_display,tag=cs2d.lbT]
# 尺寸（格数）w = x2-x1+1 , d = z2-z1+1
scoreboard players operation #w cs2d.g = #tx2 cs2d.g
scoreboard players operation #w cs2d.g -= #tx1 cs2d.g
scoreboard players operation #w cs2d.g += #one cs2d.g
scoreboard players operation #d cs2d.g = #tz2 cs2d.g
scoreboard players operation #d cs2d.g -= #tz1 cs2d.g
scoreboard players operation #d cs2d.g += #one cs2d.g
execute store result storage cs2d:fx w float 1 run scoreboard players get #w cs2d.g
execute store result storage cs2d:fx d float 1 run scoreboard players get #d cs2d.g
# 玻璃：block_display 由「最低角」向外生长，故生成在角1 (x1, y1+1, z1)
scoreboard players operation #hx cs2d.g = #tx1 cs2d.g
scoreboard players operation #hy cs2d.g = #ty1 cs2d.g
scoreboard players operation #hy cs2d.g += #one cs2d.g
scoreboard players operation #hz cs2d.g = #tz1 cs2d.g
function cs2d:map/mk_at
execute at @e[type=marker,tag=cs2d.tmpmk,limit=1] run summon minecraft:block_display ~ ~ ~ {Tags:["cs2d.fx","cs2d.fxT"],block_state:{Name:"minecraft:orange_stained_glass"},glow_override:15,transformation:{translation:[0f,0.02f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[1f,1f,1f]}}
data modify entity @e[tag=cs2d.fxT,type=block_display,limit=1] transformation.scale[0] set from storage cs2d:fx w
data modify entity @e[tag=cs2d.fxT,type=block_display,limit=1] transformation.scale[1] set value 0.12f
data modify entity @e[tag=cs2d.fxT,type=block_display,limit=1] transformation.scale[2] set from storage cs2d:fx d
kill @e[type=marker,tag=cs2d.tmpmk]
# 标签：文字以实体位置居中，故生成在区域中心上方 2 格
scoreboard players operation #hx cs2d.g = #tx1 cs2d.g
scoreboard players operation #hx cs2d.g += #tx2 cs2d.g
scoreboard players operation #hx cs2d.g += #one cs2d.g
scoreboard players operation #hx cs2d.g /= #two cs2d.g
scoreboard players operation #hy cs2d.g = #ty1 cs2d.g
scoreboard players operation #hy cs2d.g += #one cs2d.g
scoreboard players operation #hz cs2d.g = #tz1 cs2d.g
scoreboard players operation #hz cs2d.g += #tz2 cs2d.g
scoreboard players operation #hz cs2d.g += #one cs2d.g
scoreboard players operation #hz cs2d.g /= #two cs2d.g
function cs2d:map/mk_at
execute at @e[type=marker,tag=cs2d.tmpmk,limit=1] run summon minecraft:text_display ~ ~ ~ {Tags:["cs2d.fx","cs2d.lbT"],text:'{"text":"T 出生区","color":"#F0A54A","bold":true}',shadow:1b,billboard:"vertical",transformation:{translation:[0f,2.0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f]}}
kill @e[type=marker,tag=cs2d.tmpmk]
