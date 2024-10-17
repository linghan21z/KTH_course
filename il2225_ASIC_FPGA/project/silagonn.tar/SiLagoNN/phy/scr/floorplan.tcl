set margin 10
set drra_width 230
set drra_height 250

#Create a floorplan based on the values above with suitable dimensions for width, height and margin
create_floorplan -site core -core_size [expr {8*$drra_width + 9*$margin}] [expr {2*$drra_height + 3*$margin}] 0 0 0 0
#here is a question, does margin between every title necessary？
#create_floorplan ...

#plan drra tiles
for {set i 0} {$i < 8} {incr i} {
    set x1 [expr {double($margin * ($i + 1) + $drra_width * $i)}]
    set y1 [expr {double($margin)}]
    set x2 [expr {double($x1 + $drra_width)}]
    set y2 [expr {double($y1 + $drra_height)}]

    set x3 [expr {double($x1)}]
    set y3 [expr {double($y1 + $drra_height + $margin)}]
    set x4 [expr {double($x2)}]
    set y4 [expr {double($y2 + $drra_height + $margin)}]

    set cell [lindex ${partition_hinst_list} [expr {$i * 2}]]
    puts $cell
    create_boundary_constraint -type fence -hinst $cell -rects [list [list $x1 $y1 $x2 $y2]]

    set cell [lindex ${partition_hinst_list} [expr {($i * 2) + 1}]]
    puts $cell
    create_boundary_constraint -type fence -hinst $cell -rects [list [list $x3 $y3 $x4 $y4]]
# set coordinates and place drra tiles
}
