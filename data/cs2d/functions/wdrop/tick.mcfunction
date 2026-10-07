# ===== 掉落武器拾取（每 tick）=====
# ① 锁定所有掉落武器：谁都不能直接捡（经过不捡）
execute as @e[type=item,tag=cs2d.wdrop] run data modify entity @s PickupDelay set value 32767
execute as @e[type=item,tag=cs2d.wdrop] run data modify entity @s Age set value -32768
# ② 潜行玩家（非下包/拆包中）在 1.5 格内 → 解锁，交给原版拾取
execute as @e[type=item,tag=cs2d.wdrop] at @s if entity @a[gamemode=!spectator,nbt={Sneaking:1b},distance=..1.5,limit=1,tag=!cs2d.planting,tag=!cs2d.defusing] run data modify entity @s PickupDelay set value 0
