# C4 掉落（@s = 刚死去的携带者）
# 原版掉落物谁都能捡，所以先销毁它，改放一个「锁定拾取」的掉落物自己接管：
#   · PickupDelay 锁死 → 任何人（包括 CT）都捡不起来
#   · Age 锁死        → 不会 5 分钟后自动消失
#   · 掉落物本体可见  → 匪一眼就能看到包掉在哪
kill @e[type=item,nbt={Item:{tag:{cs2d_c4:1b}}}]
execute at @s run summon minecraft:item ~ ~0.3 ~ {Tags:["cs2d.c4drop"],PickupDelay:32767s,Age:-32768s,CustomName:'{"text":"C4 炸弹","color":"red","bold":true}',CustomNameVisible:1b,Item:{id:"minecraft:redstone_block",Count:1b,tag:{cs2d_c4:1b,cs2d_s:7b,display:{Name:'{"text":"C4 炸弹","color":"red","italic":false}',Lore:['{"text":"站在包点内按住潜行（Shift）3.25 秒安放","color":"gray","italic":false}','{"text":"移动或松开蹲会中断","color":"dark_gray","italic":false}','{"text":"爆炸倒计时 40 秒","color":"dark_gray","italic":false}']}}}}
# 再叠一个发光方块：穿墙也能看见位置（Glowing 让轮廓透过墙壁渲染）
execute at @s run summon minecraft:block_display ~ ~ ~ {Tags:["cs2d.c4fx"],Glowing:1b,block_state:{Name:"minecraft:redstone_block"},brightness:{sky:15,block:15},transformation:{translation:[-0.25f,0f,-0.25f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[0.5f,0.5f,0.5f]}}
scoreboard players set @s cs2d.c4 0
