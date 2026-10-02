# 凯夫拉 + 头盔
scoreboard players remove @s cs2d.money 650
item replace entity @s armor.chest with minecraft:leather_chestplate{cs2d_arm:1b,display:{color:10511680,Name:'{"text":"凯夫拉","italic":false}'}} 1
item replace entity @s armor.head with minecraft:leather_helmet{cs2d_arm:1b,display:{color:10511680,Name:'{"text":"头盔","italic":false}'}} 1
playsound minecraft:item.armor.equip_leather player @s ~ ~ ~ 2 1
