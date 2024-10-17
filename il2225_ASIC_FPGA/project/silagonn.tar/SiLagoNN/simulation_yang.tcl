#Set the source directory
set SOURCE_DIR ../../rtl; 

vlib work
vlib dware

#Compile dware libraries into "dware"
set hierarchy_files [split [read [open ${SOURCE_DIR}/dware_hierarchy.txt r]] "\n"]
foreach filename [lrange ${hierarchy_files} 0 end-1] {
	vcom -2008 -work dware ${SOURCE_DIR}/${filename}
}
set hierarchy_files [split [read [open ${SOURCE_DIR}/dware_hierarchy_verilog.txt r]] "\n"]
foreach filename [lrange ${hierarchy_files} 0 end-1] {
    vlog -work dware ${SOURCE_DIR}/${filename}
}


#Compile silagonn design into "work"
set hierarchy_files_s [split [read [open ${SOURCE_DIR}/silagonn_hierarchy.txt r]] "\n"]
foreach filename [lrange ${hierarchy_files_s} 0 end-1] {
	vcom -2008 -work work ${SOURCE_DIR}/${filename}
}
#set hierarchy_files_s [split [read [open ${SOURCE_DIR}/dware_hierarchy_verilog.txt r]] "\n"]
#foreach filename [lrange ${hierarchy_files_s} 0 end-1] {
#    vlog -work work ${SOURCE_DIR}/${filename}


#Compile ./const_package.vhd 
vcom -2008 -work work const_package.vhd

#Compile ./testbench.vhd 
vcom -2008 -work work testbench.vhd

#Open the simulation
vsim -voptargs=+acc work.testbench

#Load the waveform. You may see some errrors in loading the waveform that it cannot find some of the signals mentioned in the wave.do file. This is okay.
do wave.do
add wave sim:/testbench/*
wave zoom full

#Run simulation for 1000ns
run 1000 ns;
