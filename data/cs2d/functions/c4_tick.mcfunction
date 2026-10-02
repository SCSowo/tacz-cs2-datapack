# ===== 掉落的 C4（每 tick）=====
# ① 没被接管的 C4 掉落物一律销毁：警察走过去也捡不到
kill @e[type=item,nbt={Item:{tag:{cs2d_c4:1b}}},tag=!cs2d.c4drop]
# ② 警察手里要是有 C4，立刻没收（防止同一 tick 内已经捡起来了）
clear @a[team=!T] minecraft:redstone_block{cs2d_c4:1b}
# ③ 掉落物锁定：谁都捡不起、也不会超时消失（拾取完全由 ④ 接管）
execute as @e[type=item,tag=cs2d.c4drop] run data modify entity @s PickupDelay set value 32767
execute as @e[type=item,tag=cs2d.c4drop] run data modify entity @s Age set value -32768
# ④ 匪走到掉落点 2 格内自动捡起
execute as @e[type=item,tag=cs2d.c4drop] at @s as @a[team=T,gamemode=!spectator,distance=..2,limit=1,sort=nearest] run function cs2d:c4_take
