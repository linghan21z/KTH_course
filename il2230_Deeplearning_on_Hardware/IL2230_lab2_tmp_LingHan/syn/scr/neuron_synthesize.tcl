remove_design -all
source ../../synopsys_dc.setup

read_file -format vhdl -lib WORK {"../rtl/types.vhd"}
read_file -format vhdl -lib WORK {"../rtl/memory.vhd"}
current_design memory
link
uniquify
source ../syn/neuron.sdc
source ../syn/db/memory.wscr
compile

read_file -format vhdl -lib WORK {"../rtl/types.vhd"}
read_file -format vhdl -lib WORK {"../rtl/fsm.vhd"}
current_design fsm
link
uniquify
source ../syn/neuron.sdc
source ../syn/db/fsm.wscr
compile

read_file -format vhdl -lib WORK {"../rtl/types.vhd"}
read_file -format vhdl -lib WORK {"../rtl/Sigmoid.vhd"}
read_file -format vhdl -lib WORK {"../rtl/mac.vhd"}
read_file -format vhdl -lib WORK {"../rtl/arithmetic_unit.vhd"}
current_design arithmetic_unit
link
uniquify
source ../syn/db/arithmetic_unit.wscr
compile

read_file -format vhdl -lib WORK {"../rtl/types.vhd"}
read_file -format vhdl -lib WORK {"../rtl/arithmetic_unit.vhd"}
read_file -format vhdl -lib WORK {"../rtl/memory.vhd"}
read_file -format vhdl -lib WORK {"../rtl/fsm.vhd"}
read_file -format vhdl -lib WORK {"../rtl/neuron.vhd"}
current_design neuron
link
uniquify
source ../syn/neuron.sdc
source ../syn/db/neuron.wscr
compile

report_constraint
report_area
report_power
report_timing

characterize -constraint {ARITHMETIC_UNIT_1 FSM_1 MEMORY_1}

current_design fsm
write_script > ../syn/db/fsm.wscr

current_design arithmetic_unit
write_script > ../syn/db/arithmetic_unit.wscr

current_design memory
write_script > ../syn/db/memory.wscr

# current_design ReLu
# write_script > ../syn/db/ReLu.wscr

current_design neuron
write_script > ../syn/db/neuron.wscr
