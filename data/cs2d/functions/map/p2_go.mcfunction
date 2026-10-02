function cs2d:map/pos_read
scoreboard players operation #r2x cs2d.g = #px cs2d.g
scoreboard players operation #r2y cs2d.g = #py cs2d.g
scoreboard players operation #r2z cs2d.g = #pz cs2d.g
function cs2d:map/from_corners
function cs2d:map/apply
kill @e[type=block_display,tag=cs2d.p1]
scoreboard players set #hasp1 cs2d.g 0
