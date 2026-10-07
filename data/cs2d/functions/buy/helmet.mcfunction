# 凯夫拉 + 头盔  $1000（已有背心则补头盔 $350）
execute if score @s cs2d.arm matches 2 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if score @s cs2d.arm matches 1 if score @s cs2d.money matches 350.. run function cs2d:buy/grant_helmet
execute if score @s cs2d.arm matches 1 unless score @s cs2d.money matches 350.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
execute if score @s cs2d.arm matches 0 if score @s cs2d.money matches 1000.. run function cs2d:buy/grant_armor2
execute if score @s cs2d.arm matches 0 unless score @s cs2d.money matches 1000.. run playsound minecraft:entity.villager.no player @s ~ ~ ~ 2 1
