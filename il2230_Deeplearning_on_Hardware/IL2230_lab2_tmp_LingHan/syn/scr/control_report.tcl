read_file -format vhdl -lib WORK {"../rtl/types.vhd"}
read_file -format vhdl -lib WORK {"../rtl/fsm.vhd"}
current_design fsm
link
uniquify
source ../syn/neuron.sdc
source ../syn/db/fsm.wscr
compile

# read_file -format vhdl -lib WORK {"../rtl/ReLu.vhd"}
# current_design relu
# link
# uniquify
# source ../syn/neuron.sdc
# source ../syn/db/ReLu.wscr
# compile
report_area
