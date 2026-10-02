# 主武器占位：T=铁剑(AK) / CT=钻石剑(M4)
scoreboard players remove @s cs2d.money 2700
clear @s minecraft:wooden_sword
clear @s minecraft:iron_sword
clear @s minecraft:diamond_sword
execute if entity @s[team=T] run item replace entity @s weapon.mainhand with minecraft:iron_sword{display:{Name:'{"text":"AK-47（占位武器）","color":"gold","italic":false}'}} 1
execute if entity @s[team=CT] run item replace entity @s weapon.mainhand with minecraft:diamond_sword{display:{Name:'{"text":"M4A4（占位武器）","color":"blue","italic":false}'}} 1
playsound minecraft:item.armor.equip_iron player @s ~ ~ ~ 2 1
