# 炸弹爆炸
# 范围（CS2 近期把 C4 爆炸半径调大了）：
#   12 格内 = 必死区；12~20 格 = 重伤区（瞬间伤害 IV，满血也只剩 8 血）
execute as @e[type=marker,tag=cs2d.bomb] at @s run particle minecraft:explosion ~ ~1 ~ 2 2 2 0.3 200 normal
execute as @e[type=marker,tag=cs2d.bomb] at @s run particle minecraft:flame ~ ~1 ~ 3 1 3 0.2 120 normal
execute as @e[type=marker,tag=cs2d.bomb] at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 6 0.8
# 必死区
execute as @a[gamemode=!spectator] at @s if entity @e[type=marker,tag=cs2d.bomb,distance=..12,limit=1] run function cs2d:death
# 重伤区（不会秒杀，但基本失去战斗力）
execute as @a[gamemode=!spectator] at @s if entity @e[type=marker,tag=cs2d.bomb,distance=12..20,limit=1] run effect give @s minecraft:instant_damage 1 2 true
execute as @a[gamemode=!spectator] at @s if entity @e[type=marker,tag=cs2d.bomb,distance=12..20,limit=1] run playsound minecraft:entity.generic.hurt master @s ~ ~ ~ 3 0.7
kill @e[type=marker,tag=cs2d.bomb]
kill @e[type=item_display,tag=cs2d.bombfx]
scoreboard players set #planted cs2d.g 0
scoreboard players set #reason cs2d.g 2
execute if score #state cs2d.g matches 2 run function cs2d:win_t
