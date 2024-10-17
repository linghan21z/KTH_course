#This is the parent script for flat implementation
source ../phy/scr/read_design.tcl

#power -rings, stripes
#set_db add_rings_target default ; set_db add_rings_extend_over_row 0 ; set_db add_rings_ignore_rows 0 ; set_db add_rings_avoid_short 0 ; set_db add_rings_skip_shared_inner_ring none ; set_db add_rings_stacked_via_top_layer M9 ; set_db add_rings_stacked_via_bottom_layer M1 ; set_db add_rings_via_using_exact_crossover_size 1 ; set_db add_rings_orthogonal_only true ; set_db add_rings_skip_via_on_pin {  standardcell } ; set_db add_rings_skip_via_on_wire_shape {  noshape }
#add_rings -nets {VDD VSS} -type core_rings -follow core -layer {top M1 bottom M1 left M2 right M2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none

#set_db add_stripes_ignore_block_check false ; set_db add_stripes_break_at none ; 
#set_db add_stripes_route_over_rows_only false ; set_db add_stripes_rows_without_stripes_only false ; 
#set_db add_stripes_extend_to_closest_target none ; set_db add_stripes_stop_at_last_wire_for_area false ; set_db add_stripes_partial_set_through_domain false ; set_db add_stripes_ignore_non_default_domains false ; set_db add_stripes_trim_antenna_back_to_shape none ; set_db add_stripes_spacing_type edge_to_edge ; set_db add_stripes_spacing_from_block 0 ; set_db add_stripes_stripe_min_length stripe_width ; set_db add_stripes_stacked_via_top_layer M9 ; set_db add_stripes_stacked_via_bottom_layer M1 ; set_db add_stripes_via_using_exact_crossover_size false ; set_db add_stripes_split_vias false ; set_db add_stripes_orthogonal_only true ; set_db add_stripes_allow_jog { padcore_ring  block_ring } ; set_db add_stripes_skip_via_on_pin {  standardcell } ; set_db add_stripes_skip_via_on_wire_shape {  blockring  blockwire  ring       corewire   followpin  fillwire   iowire     padring    stripe     noshape   }
#add_stripes -nets {VDD VSS} -layer M2 -direction vertical -width 1.8 -spacing 1.8 -set_to_set_distance 100 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit M9 -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M9 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none

set_db add_rings_target default ; set_db add_rings_extend_over_row 0 ; set_db add_rings_ignore_rows 0 ; set_db add_rings_avoid_short 0 ; set_db add_rings_skip_shared_inner_ring none ; set_db add_rings_stacked_via_top_layer M9 ; set_db add_rings_stacked_via_bottom_layer M1 ; set_db add_rings_via_using_exact_crossover_size 1 ; set_db add_rings_orthogonal_only true ; set_db add_rings_skip_via_on_pin {  standardcell } ; set_db add_rings_skip_via_on_wire_shape {  noshape }
add_rings -nets {VDD VSS} -type core_rings -follow core -layer {top M1 bottom M1 left M2 right M2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid none

set_db add_stripes_ignore_block_check false ; set_db add_stripes_break_at none ; set_db add_stripes_route_over_rows_only false ; set_db add_stripes_rows_without_stripes_only false ; set_db add_stripes_extend_to_closest_target none ; set_db add_stripes_stop_at_last_wire_for_area false ; set_db add_stripes_partial_set_through_domain false ; set_db add_stripes_ignore_non_default_domains false ; set_db add_stripes_trim_antenna_back_to_shape none ; set_db add_stripes_spacing_type edge_to_edge ; set_db add_stripes_spacing_from_block 0 ; set_db add_stripes_stripe_min_length stripe_width ; set_db add_stripes_stacked_via_top_layer M9 ; set_db add_stripes_stacked_via_bottom_layer M1 ; set_db add_stripes_via_using_exact_crossover_size false ; set_db add_stripes_split_vias false ; set_db add_stripes_orthogonal_only true ; set_db add_stripes_allow_jog { padcore_ring  block_ring } ; set_db add_stripes_skip_via_on_pin {  standardcell } ; set_db add_stripes_skip_via_on_wire_shape {  noshape   }
add_stripes -nets {VDD  VSS} -layer M2 -direction vertical -width 1.8 -spacing 1.8 -set_to_set_distance 25 -start_from left -switch_layer_over_obs false -max_same_layer_jog_length 2 -pad_core_ring_top_layer_limit M9 -pad_core_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M9 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid none


place_design

ccopt_design
assign_io_pins
route_design
write_db ../phy/db/silagonn.dat
write_netlist ../phy/db/silagonn.v
write_sdf ../phy/db/silagonn.sdf
write_sdc ../phy/db/silagonn.sdc

report_timing > ../phy/rpt/${TOP_NAME}_timing.txt