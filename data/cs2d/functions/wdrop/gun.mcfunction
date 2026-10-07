# 掉落主武器（槽 0），没有则掉落手枪（槽 1）—— CS2：有主武器掉主武器，不掉手枪
execute if data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] run data modify storage cs2d:tmp wditem set from entity @s Inventory[{Slot:0b}]
execute if data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] run data remove storage cs2d:tmp wditem Slot
execute if data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] run function cs2d:wdrop/spawn
execute unless data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] if data entity @s Inventory[{Slot:1b,id:"tacz:modern_kinetic_gun"}] run data modify storage cs2d:tmp wditem set from entity @s Inventory[{Slot:1b}]
execute unless data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] if data entity @s Inventory[{Slot:1b,id:"tacz:modern_kinetic_gun"}] run data remove storage cs2d:tmp wditem Slot
execute unless data entity @s Inventory[{Slot:0b,id:"tacz:modern_kinetic_gun"}] if data entity @s Inventory[{Slot:1b,id:"tacz:modern_kinetic_gun"}] run function cs2d:wdrop/spawn
