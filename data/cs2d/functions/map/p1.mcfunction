# 记录对角法「角①」（站位置上执行）
function cs2d:map/pos_read
scoreboard players operation #r1x cs2d.g = #px cs2d.g
scoreboard players operation #r1y cs2d.g = #py cs2d.g
scoreboard players operation #r1z cs2d.g = #pz cs2d.g
scoreboard players set #hasp1 cs2d.g 1
# 角① 标记（柔和浅灰小方块，悬浮在该格中心；选完角② 自动消失）
kill @e[type=block_display,tag=cs2d.p1]
scoreboard players operation #hx cs2d.g = #r1x cs2d.g
scoreboard players operation #hy cs2d.g = #r1y cs2d.g
scoreboard players operation #hz cs2d.g = #r1z cs2d.g
function cs2d:map/mk_at
execute at @e[type=marker,tag=cs2d.tmpmk,limit=1] run summon minecraft:block_display ~ ~ ~ {Tags:["cs2d.fx","cs2d.p1"],block_state:{Name:"minecraft:light_gray_stained_glass"},glow_override:4,transformation:{translation:[0.25f,0.25f,0.25f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f]}}
kill @e[type=marker,tag=cs2d.tmpmk]
tellraw @a [{"text":"[CS2] 角① → ","color":"green"},{"score":{"name":"#r1x","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#r1y","objective":"cs2d.g"},"color":"white"},{"text":",","color":"gray"},{"score":{"name":"#r1z","objective":"cs2d.g"},"color":"white"},{"text":"　现在走到对角位置，点「记录角②」","color":"#9AD9A0"}]
