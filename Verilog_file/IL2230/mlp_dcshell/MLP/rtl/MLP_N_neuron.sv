module MLP_N_neuron #(parameter M = 2, parameter N = 2, parameter QM = 3, parameter QN = 5, parameter WM = 3, parameter WN = 5)(
 	input  logic		clk,
 	input  logic 		nrst,
 	input  logic		init,
 	input  logic        initial_flag,
   	input  logic        weight_flag,
   	input  logic signed [QM + QN - 1:0] x [N-1:0], 
   	input  logic signed [QM + QN - 1:0] w [M-2:0][N-1:0][N-1:0],
   	input  logic signed [QM + QN - 1:0] b [M-2:0][N-1:0],
    output logic signed [QM + QN - 1:0] outputs
 );
 
	//my try
	assign outputs = NEU.result[0];

 	// Signals for fsm:
 	logic read_en, write_en, done;
 	// Signals for memory:
    logic [$clog2(M-1)-1 :0] layer_addr;
    logic signed [QM + QN - 1:0] inputs [N-1:0];
    logic signed [WM + WN - 1:0] weights [N-1:0][N-1:0];
 	logic signed [QM + QN - 1:0] bias [N-1:0];
 	logic signed [QM + QN - 1:0] result [N-1:0];
 
 	fsm_N_neuron #(.M(M), .N(N)) FSM (.*);
 	memory_N_neuron #(.M(M), .N(N), .QM(QM), .QN(QN), .WM(WM), .WN(WN)) MEM (.*);
 	N_neurons #(.M(M), .N(N), .QM(QM), .QN(QN), .WM(WM), .WN(WN)) NEU (.*);
 
 endmodule
