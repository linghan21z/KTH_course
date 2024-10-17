We have two designs, one is the one-neuron design, and the other is the N-neuron design.
1. The one-neuron design for M × N MLP under 32-bit or 8-bit data precision, which contains files:(following by hierarchy)
MAC.sv
ReLU.sv
fully_parallel.sv
memory.sv
fsm_one_neuron.sv
single_neuron.sv
MLP_one_neuron.sv

2. The N-neuron design for M × N MLP under 32-bit or 8-bit data precision, which contains files:(following by hierarchy)
MAC.sv
ReLU.sv
fully_parallel.sv
memory_N_neuron.sv
fsm_N_neurons.sv
N_neurons.sv
MLP_N_neuron.sv

And the testbench file is MLP_testbench.sv.
It is supposed to test at least the following six combinations of M and N, namely,
(M, N) = (3, 3), (3, 8), (3, 16) and (8, 3), (8, 8), (16, 16).

For simulation, complile all the design files and the testbench in Questisim, and simulate the testbench to see how the waveforms perform.
For synthesis, use VIVADO to synthesize the design files, and report the results of area, power, and time.