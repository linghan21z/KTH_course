while read fn
do
  vcom -2008 ./rtl/${fn}
done < ./rtl/neuron_hierarchy.txt

vcom -2008 ./tb/neuron_tb.vhd

vsim work.neuron_tb


