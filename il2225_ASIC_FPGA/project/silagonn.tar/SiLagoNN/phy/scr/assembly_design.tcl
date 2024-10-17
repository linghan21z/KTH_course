read_db ../phy/db/part/drra_wrapper.enc.dat/pnr

assemble_design -block_dir ../phy/db/part/Silago_top_left_corner.enc.dat/pnr -encounter_format 
assemble_design -block_dir ../phy/db/part/Silago_bot_left_corner.enc.dat/pnr -encounter_format 

for {set i 0} {$i < 6} {incr i} {
	assemble_design -block_dir ../phy/db/part/Silago_top_$i.enc.dat/pnr -encounter_format 
	assemble_design -block_dir ../phy/db/part/Silago_bot_$i.enc.dat/pnr -encounter_format 
}

assemble_design -block_dir ../phy/db/part/Silago_top_right_corner.enc.dat/pnr -encounter_format 
assemble_design -block_dir ../phy/db/part/Silago_bot_right_corner.enc.dat/pnr -encounter_format 