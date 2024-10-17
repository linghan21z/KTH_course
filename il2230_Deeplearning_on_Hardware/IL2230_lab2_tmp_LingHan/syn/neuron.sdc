create_clock -period 2.5 [get_port clk]
set_false_path -from [get_port nrst]

#set_drive resistance [get_pins sample_in]
#set_load
#set_input_delay
