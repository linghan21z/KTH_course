################################################################################
# Design Compiler logic synthesis script
################################################################################
#
# This script is meant to be executed with the following directory structure
#
# project_top_folder
# |
# |- db: store output data like mapped designs or physical files like GDSII
# |
# |- phy: physical synthesis material (scripts, pins, etc)
# |
# |- rtl: contains rtl code for the design, it should also contain a
# |       hierarchy.txt file with the all the files that compose the design
# |
# |- syn: logic synthesis material (this script, SDC constraints, etc)
# |
# |- sim: simulation stuff like waveforms, reports, coverage etc.
# |
# |- tb: testbenches for the rtl code
# |
# |- exe: the directory where it should be executed. This keeps all the temp files
#         created by DC in that directory
#
#
# The standard way of executing the is from the project_top_folder
# with the following command
#
# $ dc_shell -f ../syn/dc_flat.tcl
#
# Additionally it should be possible to do
#
# $ make syn
#
# If the standard Makefile is present in the project directory
# Please check if you have the right constraints in ./syn/constraints.sdc
# Additionaly, please make sure that you have replaced SRAM_model with SRAM Macro
################################################################################

#Remove all Design #add myself
remove_design -all

set SynopsysHome /afs/ict.kth.se/pkg/synopsys/designcompiler/J-2014.09
set search_path "/afs/ict.kth.se/pkg/synopsys/designcompiler/J-2014.09/libraries/syn\
                 /afs/it.kth.se/pkg/synopsys/extra_libraries/standard_cell/TSMC/tcbn90g_110a/Front_End/timing_power/tcbn90g_110a/"

# SYNTH VHDL FILE DEFAULTS
set view_read_file_suffix 		"db sdb edif sedif vhd vhdl st script"
set view_analyze_file_suffix 		"v vhd vhdl"
set template_parameter_style 		"%d"; # Limits the lenght of comp. names

set link_path 				${search_path}
set symbol_library 			"tcbn90g.sdb"
set synthetic_library 			"standard.sldb\
					 dw_foundation.sldb";

#set target_library 			"tcbn90gtc.db"
##modify
set target_library "tcbn90gtc.db dw_foundation.sldb"
set link_library 			"* ${target_library}"

# set the TOP_NAME of the design
set TOP_NAME drra_wrapper

# Directories for output material
set REPORT_DIR  ../syn/rpt;      # synthesis reports: timing, area, etc.
set OUT_DIR ../syn/db;           # output files: netlist, sdf sdc etc.
set SOURCE_DIR ../rtl;           # rtl code that should be synthesised
set SYN_DIR ../syn;              # synthesis directory, synthesis scripts constraints etc.


#set hierarchy files and analyze them
set hierarchy_files [split [read [open ${SOURCE_DIR}/${TOP_NAME}_hierarchy.txt r]] "\n"]
foreach filename [lrange ${hierarchy_files} 0 end-1] {
    if {![string equal [string index $filename 0] "#"]} {  #check if file name begin with #, if not, go on
        if {[string equal [file extension $filename] ".vhd"]} {
            analyze -format vhdl -lib WORK ${SOURCE_DIR}/${filename}
        } elseif {[string equal [file extension $filename] ".v"]} {
            analyze -format verilog -lib WORK ${SOURCE_DIR}/${filename}
        }
	}
}

#set current_design attribute
elaborate ${TOP_NAME}
current_design ${TOP_NAME}

#elaborate the design, link, and uniquify
link
uniquify

#source sdc file
source ${SYN_DIR}/constraints.sdc
#compile
compile

#report area, timing, power, constraints, cell in the report directory with a suitable name
report_constraints > ${REPORT_DIR}/${TOP_NAME}_constratints.sdc
report_area > ${REPORT_DIR}/${TOP_NAME}_area.txt
report_cell > ${REPORT_DIR}/${TOP_NAME}_cells.txt
report_timing > ${REPORT_DIR}/${TOP_NAME}_timing.txt
report_power > ${REPORT_DIR}/${TOP_NAME}_power.txt

#export the netlist, ddc and sdf file in out direcory with a suitable name
#这个 .v  是netlist? .ddc是设计约束  .sdf时序文件
write -hierarchy -format verilog -output ${OUT_DIR}/${TOP_NAME}.v      
write -hierarchy -format ddc -output ${OUT_DIR}/${TOP_NAME}.ddc
write_sdf "${OUT_DIR}/${TOP_NAME}.sdf"
write_sdc "${OUT_DIR}/${TOP_NAME}.sdc"
