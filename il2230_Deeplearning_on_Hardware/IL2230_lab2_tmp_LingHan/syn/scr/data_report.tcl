# read_file -format vhdl -lib WORK {"../rtl/Sigmoid.vhd"}
read_file -format vhdl -lib WORK {"../rtl/ReLu.vhd"}
read_file -format vhdl -lib WORK {"../rtl/mac.vhd"}
read_file -format vhdl -lib WORK {"../rtl/arithmetic_unit.vhd"}
current_design arithmetic_unit
link
uniquify
source ../syn/db/arithmetic_unit.wscr
compile

current_design arithmetic_unit
report_area
