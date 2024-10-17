module single_neuron 
#(parameter M = 3, N = 2, QM = 3, QN = 5, WM = 6, WN = 10)
(
    input  logic clk, nrst,
    input  logic signed [QM + QN - 1:0] inputs [N-1:0], 
    input  logic signed [WM + WN - 1:0] weights [N-1:0], 
    input  logic signed [QM + QN - 1:0] bias, 
    output logic signed [QM + QN - 1:0] result 
);

    // 实例 fully_parallel module
	fully_parallel #(.N(N), .QM(QM), .QN(QN), .WM(WM), .WN(WN)) neuron (
	    .in(inputs),
	    .weights(weights),
	    .bias(bias),
	    .out(result)
	);

endmodule
